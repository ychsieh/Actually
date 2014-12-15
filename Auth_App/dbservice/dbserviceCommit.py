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

def storeCommit(commitTime, project, developer, task):
	commit = Commit(commitTime = commitTime, developer = developer, project = project, task = task)
	commit.save()

def storeAttrValue(commit, attrValueList):
	for key, value in attrValueList.items():
		extensibility = Extensibility(commit = commit, attribute = key, value = value)
		extensibility.save()

def findLinesofCodebyProjectIDDeverloperID(projectID, developerID):
	commit = Commit.objects.get(project = projectID, developer = developerID)
	return commit.linescode