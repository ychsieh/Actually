from django.shortcuts import render, render_to_response
from Auth_App.models import Project, PM, Developer, Milestone, Section, Task, Commit, Extensibility
from django.http import HttpResponse, HttpResponseRedirect
from itertools import chain

def storeCommit(commitTime, project, developer, task):
	commit = Commit(commitTime = commitTime, developer = developer, project = project, task = task)
	commit.save()

def storeAttrValue(commit, attrValueList):
	for key, value in attrValueList.items():
		extensibility = Extensibility(commit = commit, attribute = key, value = value)
		extensibility.save()