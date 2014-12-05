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
        dict_item["expected"] = task.optional1
        dict_item["actual"] = task.progress * 100
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






