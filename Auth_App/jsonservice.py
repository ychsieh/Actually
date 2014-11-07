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
