from django.shortcuts import render_to_response, redirect, render
from django.template import RequestContext
from django.core.urlresolvers import reverse
import urllib, urllib2
from urllib2 import urlopen, Request
import json
import re
from Auth_App.models import PM
from Auth_App.models import Developer
from Auth_App.models import Project
from Auth_App.models import Section
from django.http import HttpResponse
from django.http import HttpRequest

from django.core import serializers
from dbservice import *
from expectcal import *
from datautils import *


GITHUB_CLIENT_ID = 'd8d60af4bfa5ebe8bb67'
GITHUB_CLIENT_SECRET = '6c174e8d8e473916f542b1016f808097e43ede99'
scope = 'user,repo'
homepage = 'http://127.0.0.1:8000'
access_token = ''

def index(request):
    return render_to_response('landing.html', {'client_id':GITHUB_CLIENT_ID, 'scope':scope})

def getStats():
	global access_token
	url = 'https://api.github.com/repos/sinkerplus/Actually/stats/contributors'
	request = Request(url)
	request.add_header('Authorization', 'token %s' % access_token)
	response = urlopen(request)
	result = response.read()
	return result

def save_to_db(percentage, sub_name, person, project, time):
	if(Project.objects.filter(name= project) is None):
		return 'No Project'
	else:
		p1 = Project.objects.filter(name= project)
	if(Developer.objects.filter(githubName = person) is None):
		return 'No Developer'
	else:
		developer1= Developer.objects.filter(githubName = person)
	if(Task.objects.filter(name = sub_name) is None):
		return 'No Task'
	else:	
		task1 = Task.objects.filter(name = sub_name)
		for element in task1:
			element.update(percentage)
			if(len(Commit.objects.filter(commitTime = time, developer=developer1[0])) == 0):
				new_commit = Commit(commitTime = time, progress = percentage, developer = developer1[0], project = project, task=task1[0])
				new_commit.save()
			else:
				pass
		return ''

## used to get oauth from gitHub
def get_oauth(request):
    GITHUB_REQUEST_PERMISSIONS = request.GET.__getitem__('code')
    url = 'https://github.com/login/oauth/access_token'
    values = { 'client_id':GITHUB_CLIENT_ID, 'client_secret':GITHUB_CLIENT_SECRET, 'code':GITHUB_REQUEST_PERMISSIONS}
    data = urllib.urlencode(values, doseq=True)
    req = urllib2.Request(url, data)
## A http request with our authorized client id and sercret key
## is sent to github
    response = urllib2.urlopen(req)
    the_page = response.read()
## an access_token is returned
    access_token = the_page.split('=', 1)[1].split('&', 1)[0]
    return access_token

def auth(request):
    access_token = None
    sessionUser = request.session.get("user")

    if sessionUser != None:
        access_token = sessionUser.get('access_token')
    if access_token == None:
        access_token = get_oauth(request)
    if access_token == "bad_verification_code":
        return render_to_response("error.html",{"msg":"You are unauthorized to view this page!"})
    username = get_user(access_token)
    userid = getDeveloperBygithubName(username).id

    #check if data base has the user, if not, create an account.
    #login

    user = {}
    user['username'] = username
    user['userimg'] = getPic(access_token)


    dprojects = []
    projects = findProjectByPM(username)
    
    #repos = get_repo_list(access_token, username)
    #return render_to_response("test.html",{"msg":repos})
    
    if projects != None:
        for project in projects:
            dict = {}
            dict["name"] = project.name
            dict["type"] = 'PM'
            dict["id"] = project.id
            dict["progress"] = project.progress * 100
            dict["expected"] = float(project.optional1) * 100
            if(project.progress / float(project.optional1) >= 1):
                dict["color"] = "green"
            if(project.progress / float(project.optional1) < 1 and project.progress / float(project.optional1) > 0.7):
                dict["color"] = "yellow"
            if(project.progress / float(project.optional1) <= 0.7):
                dict["color"] = "red"
            dprojects.append(dict)

    devprojects = findProjectByDeveloper(userid)
    for project in devprojects:
        dict = {}
        dict["name"] = project.name
        dict["type"] = 'Developer'
        dict["id"] = project.id
        dict["progress"] = project.progress * 100
        dict["expected"] = float(project.optional1) * 100
        if(project.progress / float(project.optional1) >= 1):
            dict["color"] = "green"
        if(project.progress / float(project.optional1) < 1 and project.progress / float(project.optional1) > 0.7):
            dict["color"] = "yellow"
        if(project.progress / float(project.optional1) <= 0.7):
            dict["color"] = "red"
        dprojects.append(dict)

    user['projects'] = dprojects
    user['userid'] = userid
    user['access_token'] = access_token
    request.session['user'] = user
    return render_to_response('index.html',{'projects':dprojects, 'user' : user})

def logout(request):
    if request.session.get("user") != None:
        del request.session["user"]
    return render_to_response('landing.html', {'client_id':GITHUB_CLIENT_ID, 'scope':scope})

def create_projcet(request):
    access_token = None
    sessionUser = request.session.get("user")

    if sessionUser != None:
        access_token = sessionUser.get('access_token')
    if access_token == None:
        access_token = get_oauth(request)
    if access_token == "bad_verification_code":
        return render_to_response("error.html",{"msg":"You are unauthorized to view this page!"})
    username = get_user(access_token)
    userid = getDeveloperBygithubName(username).id

    #check if data base has the user, if not, create an account.
    #login

    user = {}
    user['username'] = username
    user['userimg'] = getPic(access_token)


    dprojects = []
    projects = findProjectByPM(username)
    
    #repos = get_repo_list(access_token, username)
    #return render_to_response("test.html",{"msg":repos})
    
    if projects != None:
        for project in projects:
            dict = {}
            dict["name"] = project.name
            dict["type"] = 'PM'
            dict["id"] = project.id
            dict["progress"] = project.progress * 100
            dict["expected"] = float(project.optional1) * 100
            if(project.progress / float(project.optional1) >= 1):
                dict["color"] = "green"
            if(project.progress / float(project.optional1) < 1 and project.progress / float(project.optional1) > 0.7):
                dict["color"] = "yellow"
            if(project.progress / float(project.optional1) <= 0.7):
                dict["color"] = "red"
            dprojects.append(dict)

    devprojects = findProjectByDeveloper(userid)
    for project in devprojects:
        dict = {}
        dict["name"] = project.name
        dict["type"] = 'Developer'
        dict["id"] = project.id
        dict["progress"] = project.progress * 100
        dict["expected"] = float(project.optional1) * 100
        if(project.progress / float(project.optional1) >= 1):
            dict["color"] = "green"
        if(project.progress / float(project.optional1) < 1 and project.progress / float(project.optional1) > 0.7):
            dict["color"] = "yellow"
        if(project.progress / float(project.optional1) <= 0.7):
            dict["color"] = "red"
        dprojects.append(dict)

    user['projects'] = dprojects
    user['userid'] = userid
    user['access_token'] = access_token
    request.session['user'] = user
    return render_to_response('index.html',{'projects':dprojects, 'user' : user, 'create':"true"})

def view_setup_project(request):
    user = request.session.get("user")
    access_token = user.get("access_token")
    username = user.get("username")
    repos = get_repo_list(access_token, username)
    newProjects = []
    isNone = "true"
    for r in repos:
        dict_project = {}
        repo_info = r.split('/',1)
        reverseInfo = [repo_info[1], repo_info[0]]
        print reverseInfo
        dict_project["repo"] = repo_info[1]
        dict_project["contributors"] = get_contributors(access_token, reverseInfo)
        newProjects.append(dict_project)
        isNone = "false"
    projects = user.get('projects')
    return render_to_response('forms.html', {'newprojects':newProjects, 'projects':projects, 'user':user, 'isNone':isNone})

def viewproject(request):
    user = request.session.get("user")
    type = request.GET.get('type')
    if user.get("username") == 'treebug':
        if type == 'PM':
            return render_to_response("error.html",{"msg":"You are unauthorized to view this page!"})

    pid = request.GET.get('id')
    if int(pid) > 10:
        return render_to_response("error.html",{"msg":"404"})
    project = findProjectById(pid)
    userid = user.get("userid")
    username = user.get("username")
    
    developers = findDevelopersByProjectId(pid)
    _developers = []
    for developer in developers:
        dict = {}
        dict["lastName"] = developer.lastName
        dict["firstName"] = developer.firstName
        dict["commit"] = developer.optional1
        _developers.append(dict)
        
    data = {}
    data['name'] = project.name
    dprojects = user.get('projects')

    if(type == 'Developer'):
        #need vaildate
        data['name'] = data['name']
        section = findSectionByProjectIDDeveloperID(pid,userid)
        tasks = findTasksBySectionID(section.id)
        request.session['projectid'] = pid  
        return render_to_response('Project2.html',{'project':data,'developers':developers,'tasks':tasks,'projects1':dprojects,'user' : user},context_instance=RequestContext(request))
    elif(type == 'PM'):
        #need vaildate
        request.session['projectid'] = pid
        data['name'] = data['name']
        return render_to_response('Project.html',{'project':data,'developers':_developers,'projects1':dprojects,'user' : user},context_instance=RequestContext(request))
    else:
        return render_to_response('error.html',{'msg':'type error!!'})

