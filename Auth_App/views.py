from django.shortcuts import render_to_response, redirect, render
from django.template import RequestContext
import urllib, urllib2
from urllib2 import urlopen, Request
import json
import re
from Auth_App.models import PM, Developer, Project, Section, Task, Milestone, Commit
from django.http import HttpResponse, HttpRequest
from django.core import serializers
from dbservice import *


GITHUB_CLIENT_ID = 'd8d60af4bfa5ebe8bb67'
GITHUB_CLIENT_SECRET = '6c174e8d8e473916f542b1016f808097e43ede99'
scope = 'user,repo'
homepage = 'http://127.0.0.1:8000'
access_token = ''

def index(request):
    return render_to_response('landing.html', {'client_id':GITHUB_CLIENT_ID, 'scope':scope})

def project1(request):
    p1 = Project.objects.filter(name = 'Fake')
    getcommits_from_project(p1[0])
    return render_to_response('Project.html')

def project2(request):
    p1 = Project.objects.filter(name = 'Fasta')
    getcommits_from_project(p1[0])
    return render_to_response('Project2.html')

def newproject(request):
    return render_to_response('forms.html')
    
def main(request):
    projects = findProjectByPM('js2839')
    return render_to_response('index.html',{'projects':projects})

def getcommits_from_project(project):
	global access_token
	url1 = 'https://api.github.com/user'
	request1=Request(url1)
	request1.add_header('Authorization', 'token %s' % access_token)
	response1 = urlopen(request1)
	result1 = json.load(response1)
	person = result1['login']
	repo_info=['Fasta','js2839']
	owner= repo_info[1]
	repo = repo_info[0]
	url = 'https://api.github.com/repos/'+owner+'/'+repo+'/commits'
	data=[]
	request = Request(url)
	request.add_header('Authorization', 'token %s' % access_token)
	response = urlopen(request)
	result = json.load(response)
	for i in range(len(result)):
		print 'result0'
		data.append([result[i]['commit']['message'], result[i]['commit']['author']['name'], result[i]['commit']['author']['date']])
		print data[i]
	for com in data:
		(per,sub_name)=getPercentage(com[0])
		err = save_to_db( per, sub_name, com[1], project, com[2])
	return 

def getPercentage(result):
	pattern1 = re.compile('.*(subtask([0123456789]*))\s*(.*)%')  
	try:   
		match1 = pattern1.match(result)
		percent_s = match1.group(3)
		percent=float(percent_s)/100
		subtask_name = match1.group(1)
		return (percent,subtask_name)
	except:
		return (-1,"")

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

def get_oauth(request):
	GITHUB_REQUEST_PERMISSIONS = request.GET.__getitem__('code')
	url = 'https://github.com/login/oauth/access_token'
	values = { 'client_id':GITHUB_CLIENT_ID, 'client_secret':GITHUB_CLIENT_SECRET, 'code':GITHUB_REQUEST_PERMISSIONS}
	data = urllib.urlencode(values, doseq=True)
	req = urllib2.Request(url, data)
	response = urllib2.urlopen(req)
	the_page = response.read()
	access_token = the_page.split('=', 1)[1].split('&', 1)[0]
	return access_token

def auth(request):
    global access_token
    access_token=get_oauth(request)

    dprojects = []
    
    projects = findProjectByPM(1)
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

    devprojects = findProjectByDeveloper(1)
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

    return render_to_response('index.html',{'projects':dprojects})

def error(request):
    return render_to_response('error.html',{'msg':'error!!'})

def sendData2Front(request):
    return newProjectData(request)

def newProjectData(request):
    projects = Project.findPmDeveloperByProject('Fasta')
    print projects
    return render_to_response('forms.html',{'msg':'error!!'})

def test(request):
	developer = Developer.objects.get(id = 1)
	return render_to_response('test.html',{'test':developer })


def viewproject(request):
    type = request.GET.get('type')
    pid = request.GET.get('id')
    project = findProjectById(pid)
    
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
    dprojects = []

    projects = findProjectByPM(1)
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

    devprojects = findProjectByDeveloper(1)
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

    if(type == 'Developer'):
        #need vaildate
        data['name'] = data['name'] + ' (Developer : ShaJin)'
        section = findSectionByProjectIDDeveloperID(pid,1)
        tasks = findTasksBySectionID(section.id)
        request.session['projectid'] = pid  
        return render_to_response('Project2.html',{'project':data,'developers':developers,'tasks':tasks,'projects1':dprojects},context_instance=RequestContext(request))
    elif(type == 'PM'):
        #need vaildate
        request.session['projectid'] = pid
        data['name'] = data['name'] + ' (PM : ShaJin)'
        return render_to_response('Project.html',{'project':data,'developers':_developers,'projects1':dprojects},context_instance=RequestContext(request))
    else:
        return render_to_response('error.html',{'msg':'type error!!'})
