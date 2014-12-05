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

def setup_project(access_token):
	url1 = 'https://api.github.com/user'
	request1=Request(url1)
	request1.add_header('Authorization', 'token %s' % access_token)
	response1 = urlopen(request1)
	result1 = json.load(response1)
	picUrl = result1['avatar_url']
	return picUrl 
