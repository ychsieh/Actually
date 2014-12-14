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
from expectcal import *

## used to get the user's profile picture
## return value is the picture's url
def getPic(access_token):
	url1 = 'https://api.github.com/user'
	request1=Request(url1)
	request1.add_header('Authorization', 'token %s' % access_token)
	response1 = urlopen(request1)
	result1 = json.load(response1)
	picUrl = result1['avatar_url']
	return picUrl 

## used to get all contributors of a certain repo
## return value is a list of all contributors github login name
def get_contributors(access_token, repo_info):
	owner= repo_info[1]
	repo = repo_info[0]
	url1 = 'https://api.github.com/repos/'+owner+'/'+repo+'/collaborators'
	request1=Request(url1)
	request1.add_header('Authorization', 'token %s' % access_token)
	response1 = urlopen(request1)
	result1 = json.load(response1)
	namelist = []
	for i in result1:
		if(i['login'] != owner):
			namelist.append(i['login'])
	return namelist
	
## used to get user's info from access_token
## return value is user's github login name
def get_user(access_token):
	url1 = 'https://api.github.com/user'
	request1=Request(url1)
	request1.add_header('Authorization', 'token %s' % access_token)
	response1 = urlopen(request1)
	result1 = json.load(response1)
	username = result1['login']
	return username

## used to get user's repolist
## return value is a list of all repos
def get_repo_list(access_token, user):
	url2 = 'https://api.github.com/user/repos'
	request2=Request(url2)
	request2.add_header('Authorization', 'token %s' % access_token)
	response2 = urlopen(request2)
	result2 = json.load(response2) 
	result = []
	for i in result2:
		if (i['owner']['login'] == user):
			result.append(i['full_name']) 
	return result

## used to get all commis of a project
## All commits will be handled and stored into database
def getcommits_from_project(access_token, project, repo_info):
    user = get_user()
    for i in get_repo_list(user):
       	print i
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
		getPercentage(data[i][0])
	return data

## Used to handle all commits 
## return vaule will be a list of [attribute_name, attribute_value]
## e.g. [[att1, val1],[att2,val2],[att,val3]....]
def getPercentage(data):
	temp = data.split(';')
	print temp
	result = []
	for i in temp:
		temp_lv2 = i.split(':',1)
		print temp_lv2
		try:
			temp_result = {temp_lv2[0]: temp_lv2[1]}
			result.append(temp_result)
		except:
			pass
	return result
