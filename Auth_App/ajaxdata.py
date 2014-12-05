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
import datetime
import random




GITHUB_CLIENT_ID = 'd8d60af4bfa5ebe8bb67'
GITHUB_CLIENT_SECRET = '6c174e8d8e473916f542b1016f808097e43ede99'
scope = 'user,repo'
homepage = 'http://127.0.0.1:8000'
access_token = ''



def test(request): 

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

