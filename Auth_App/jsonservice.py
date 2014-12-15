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
from random import randrange
import random

def getpmjson(request):
    pid = request.session.get('projectid')
    developers = findDevelopersByProjectId(pid)
    json_developer = []
    for developer in developers:
        ##init bar
        dict = {}
        dict['developer'] = developer.lastName + ", " + developer.firstName
        #need to calculate, now use fake
        dict['actual_per'] = int(developer.optional2)
        #need to calculate, now use fake
        dict['exp_per'] = int(developer.optional3)
        json_developer.append(dict)        
    
    JSONData_Progress = {'data': json_developer}
    
    #fake JAONDATA
    json_linescode = []
    json_developers = []
    PERIOD_NUM = 5
    counter = 0
    while(counter < PERIOD_NUM):
        dict = {}
        dict['period'] = '2014 Q' + str(counter)
        for developer in developers:
            fullname = developer.lastName + ", " + developer.firstName
            if(counter == 0):
                json_developers.append(fullname)
            dict[fullname] = randrange(1000)
        if(counter == 0):
            dict['total'] = 1613
        json_linescode.append(dict)
        counter += 1
            
    result = {'JSONData':json_linescode, 'JSONData_Progress':JSONData_Progress,'developers':json_developers}
    return HttpResponse(json.dumps(result), content_type='application/json')

def get_column_json(request):   
    pid = request.session.get('projectid')
    project = findProjectById(pid)
    qdevelopers = findDevelopersByProjectId(pid)
    developers = []
    expected = []
    actual = []
    expectedtasks = []
    actualtasks = []
    data = {'projectname': project.name}    
    for developer in qdevelopers:
        expdict = {}
        expdict['name'] = developer.firstName
        expdict['y'] = random.randint(30,75)
        expdict['drilldown'] = "exp" + developer.firstName
        expected.append(expdict)

        actdict = {}
        actdict['name'] = developer.firstName
        actdict['y'] = random.randint(30,75)
        actdict['drilldown'] = "act" + developer.firstName
        section = findSectionByProjectIDDeveloperID(pid,developer.id)    
        actdict['section'] = section.name
        actual.append(actdict)

        exptaskDict = {}
        acttaskDict = {}
        exptaskDict['id'] = 'exp' + developer.firstName
        acttaskDict['id'] = 'act' + developer.firstName
        tasks = findTasksBySectionID(section.id)
        expdata = []
        actdata = []
        for task in tasks:
            exppercentage = float(task.expectedProgress) * 100    
            expdata.append([task.name, exppercentage])
            actpercentage = float(task.progress) * 100    
            actdata.append([task.name, actpercentage])

        exptaskDict['data'] = expdata
        expectedtasks.append(exptaskDict)
        acttaskDict['data'] = actdata
        actualtasks.append(acttaskDict)

    data['expected'] = expected
    data['actual'] = actual
    data['expectedtasks'] = expectedtasks
    data['actualtasks'] = actualtasks
    result = {'data':data}
    return HttpResponse(json.dumps(result), content_type='application/json')

def get_developer_json(request): 
    pid = request.session.get('projectid')
    user = request.session.get('user')
    project = findProjectById(pid)
    data = {}
    data["projectname"] = project.name
    data["projectprogress"] = float(project.progress) * 100
    section = findSectionByProjectIDDeveloperID(pid, user.get('userid'))
    data["sectionname"] = section.name
    data["sectionprogress"] = float(section.progress) * 100

    tasks = []
    dbtasks = findTasksBySectionID(section.id)
    for task in dbtasks:
        dict_task = {}
        dict_task["task"] = task.name
        dict_task["taskprogress"] = float(task.progress) * 100
        tasks.append(dict_task)
    data["tasks"] = tasks
    return HttpResponse(json.dumps(data), content_type='application/json')


def get_pastdue_json(request): 

    pid = request.session.get('projectid')
    user = request.session.get('user')
    project = findProjectById(pid)
    data4 = []
    tasks = findTasksByProjectID(pid)

    for task in tasks:
        datestatus = getDateAndStatus()
        info = datestatus.split(':',1)
        dict_item = {}
        dict_item["task"] = task.name
        dict_item["date"] = info[0]
        dict_item["late"] = info[1]
        dict_item["developer"] = findDeveloperByTask(task.id).firstName
        dict_item["expected"] = float(task.expectedProgress) * 100
        dict_item["actual"] = float(task.progress) * 100
        data4.append(dict_item)

    return HttpResponse(json.dumps(data4), content_type='application/json')

def getDateAndStatus():
    status = 0
    year = random.randint(2014, 2015)
    month = random.randint(1,12)
    day = random.randint(1,30)
    if year == 2014 and month <= 12 and day < 6:
        status = 'Past Due'
    else:
        status = (year - 2014) * 365 + (month * 30) + day - 11 * 30 + 6
    if(status <= 0):
        status = "Past Due"
    result = str(month) + '/' + str(day) + '/' + str(year) + ':' + str(status)
    return result

def get_process_json(request): 
    pid = request.session.get('projectid')
    user = request.session.get('user')
    developers = findDeveloperByProject(pid)

    initN = 1
    data1 = []
    for developer in developers:
        dict_item = {}
        dict_item["name"] = developer.lastName
        data = []
        for x in range(0, 15):
            data.append(initN)
            initN = getNumber(initN)   
        dict_item["data"] = data
        data1.append(dict_item)
        initN = 1
    return HttpResponse(json.dumps(data1), content_type='application/json')

def getNumber(num):
    n = random.randint(0, 10)
    return n + num
