from django.db import models
import datetime
from django.utils import timezone
from django.shortcuts import render, render_to_response
from Auth_App.models import Project, PM, Developer, Milestone, Section, Task, Commit
from django.http import HttpResponse, HttpResponseRedirect
from itertools import chain

##Calculate expected progress percentage of a certain task
def getExpectTask(task):
	milestone = Milestone.objects.get(task = task)
	task.optional3 = milestone.optional3
	task.save()
	return task.optional3

##Calculate expected progress percentage of a certain section
## Also Update subordinate tasks
def getExpectSection(section):
	project = section.project
	milestoneList = Milestone.objects.filter(project = project)
	per = 0
	for i in milestoneList:
		per = per + float(i.percentage) * getExpectMilestone(i)
	section.optional3 = per
	section.save()
	taskList = Task.objects.filter(section = section)
	for j in taskList:
		getExpectTask(j)
	return per

## Calculate expected progress percentage of a certain milestone
def getExpectMilestone(milestone ):
	currentTime = datetime.date.today()
	maxdate = milestone.project.startTime
	for i in Milestone.objects.filter(project = milestone.project):
		if (i.dueDate.day > maxdate.day and i<milestone.dueDate.day):
			maxdate = i.dueDate
	startTime = maxdate
	if((currentTime-milestone.dueDate).days > 0):
		per = 1
	elif((currentTime - startTime).days>0):
		delta1 = currentTime - startTime
		delta2 = milestone.dueDate - startTime
		per = float(delta1.days) / float(delta2.days)
		
	else:
		per = 0
	milestone.optional3 = per
	milestone.save()
	return per

## Calculate expected progress percentage of a certain project
## Also Update subordinate sections
def getExpectProject(project):
	milestoneList = Milestone.objects.filter(project = project)
	per = 0
	for i in milestoneList:
		per = per + float(i.percentage) * getExpectMilestone(i)
	project.optional3 = per
	project.save()
	sectionList = Section.objects.filter(project = project)
	for j in sectionList:
		getExpectSection(j)	
	return per
## Update function, use this to update entire database
def updateExpect():
	projectList = Project.objects.filter()
	for i in projectList:
		getExpectProject(i)
	return datetime.datetime.now()
		
