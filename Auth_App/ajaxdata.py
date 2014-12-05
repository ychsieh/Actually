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
    user = request.session.get('user')

    project = findProjectById(pid)

    data = {}

    data["projectname"] = project.name
    data["projectprogress"] = project.progress * 100
    section = findSectionByProjectIDDeveloperID(pid, user.get('userid'))
    data["sectionname"] = section.name
    data["sectionprogress"] = section.progress * 100

    tasks = []
    dbtasks = findTasksBySectionID(section.id)
    for task in dbtasks:
        dict_task = {}
        dict_task["task"] = task.name
        dict_task["taskprogress"] = task.progress * 100
        tasks.append(dict_task)
    data["tasks"] = tasks
    return HttpResponse(json.dumps(data), content_type='application/json')

