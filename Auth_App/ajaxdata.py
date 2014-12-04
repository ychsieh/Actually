from django.shortcuts import render_to_response, redirect, render
from django.template import RequestContext
import urllib, urllib2
from urllib2 import urlopen, Request
import json
import re
from Auth_App.models import PM, Developer, Project, Section, Task, Milestone, Commit
from django.http import HttpResponse, HttpRequest
from django.core import serializers
from dbservice import findTasksBySectionID, findProjectByDeveloper, findPmByProject, findProjectByPM
from dbservice import *


GITHUB_CLIENT_ID = 'd8d60af4bfa5ebe8bb67'
GITHUB_CLIENT_SECRET = '6c174e8d8e473916f542b1016f808097e43ede99'
scope = 'user,repo'
homepage = 'http://127.0.0.1:8000'
access_token = ''

def test(request):
    
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
        expdict['y'] = 30
        expdict['drilldown'] = "exp" + developer.firstName
        expected.append(expdict)

        actdict = {}
        actdict['name'] = developer.firstName
        actdict['y'] = 50
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
            exppercentage = float(task.optional3) * 100    
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

