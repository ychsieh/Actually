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
    JSONData = [{'period':'2014 Q0','developer_1': 266,'developer_2':123,'developer_3': 1347,'total':1613},{'period': '2014 Q1','developer_1': 2778,'developer_2': 1294,'developer_3': 1941},{'period': '2014 Q2','developer_1': 3712,'developer_2': 1969,'developer_3': 2501},{'period': '2014 Q3','developer_1': 4767,'developer_2': 2597,'developer_3': 3689},{'period': '2014 Q4','developer_1': 5810,'developer_2': 3914,'developer_3': 4293}]
    
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
            if(counter == 0):
                fullname = developer.lastName + ", " + developer.firstName
                json_developers.append(fullname)
            dict[fullname] = 300
        if(counter == 0):
            dict['total'] = 1613
        json_linescode.append(dict)
        counter += 1
    
    result = {'JSONData':json_linescode, 'JSONData_Progress':JSONData_Progress,'developers':json_developers}
    return HttpResponse(json.dumps(result), content_type='application/json')

