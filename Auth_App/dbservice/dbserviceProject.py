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
from django import forms
import datetime
from django.utils import timezone

def findProjectByPM(GivegithubName):
    PMs = PM.objects.filter(githubName = GivegithubName)
    projects = []
    for pm in PMs:
        for i in pm.project.all():
            projects.append(i)
    return projects

def findProjectByDeveloper(GivenDeveloperID):
	findDeveloper = Developer.objects.get(id = GivenDeveloperID)
	
	projects = []
	for developer in findDeveloper:
			for i in developer.project.all():
				projects.append(i)
	return projects

def findProjectById(pid):
    return Project.objects.get(id = pid)







