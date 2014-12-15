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

def findSectionByMilestoneID(milestoneID):
	findSectionByMilestone = Section.objects.filter(milestone = milestoneID)
	return findSectionByMilestone


def findSectionByProjectIDDeveloperID(projectID,developerID):
    section = Section.objects.get(project = projectID, developer = developerID)
    return section

#this function aims to store today's progress to a 15-day progress list,
#it's a string stored in Section.fifteenDaysProgressList
def storeFifteenDaysData(project, developer):
    thisSection = Section.objects.get(project = project, developer = developer)
    thisProgress = thisSection.progress

    progressList = str(thisSection.fifteenDaysProgressList)
    date_progress = progressList.split()

    if(len(date_progress)<15):
        date_progress.append(str(thisProgress))
    else:
        for i in range(14):
            date_progress[i] = date_progress[i+1]
        date_progress[14] = str(thisProgress)
        
    # update the fifteenDaysProgressList
    print "fuck"
    progressStr = ""
    for i in range(len(date_progress)):
        progressStr += str(date_progress[i])
        progressStr +=" "
    progressStr.rstrip()
    thisSection.fifteenDaysProgressList = progressStr
    thisSection.save()

def getFifteenDaysData(projectId, developerId):
    thisProject = Project.objects.get(pk = projectId)
    thisDeveloper = Developer.objects.get(pk = developerId)
    return str(Section.objects.get(project = thisProject, developer = thisDeveloper).fifteenDaysProgressList).split()


