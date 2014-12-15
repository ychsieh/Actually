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

def findTasksBySectionID(sectionID):
    tasks = Task.objects.filter(section = sectionID)
    return tasks

# def getCommits(developerId, projectId):
def updateProgress(taskId, progress):
    thisTask = Task.objects.get(pk = taskId)
    thisSection = thisTask.section
    thisMilestone = thisTask.milestone
    thisProject = thisSection.project

    #update this task's progress
    thisTask.progress = progress
    thisTask.save()


    #update this section's progress
    taskList = Task.objects.filter(section = thisSection)
    thisSectionProgress = 0
    for task in taskList:
        thisSectionProgress += task.progress * task.percentage
    thisSection.progress = thisSectionProgress
    thisSection.save()

    #update this milestone's progress
    taskList2 = Task.objects.filter(milestone = thisMilestone)
    thisMilestoneProgress = 0
    for task in taskList2:
        thisMilestoneProgress += task.progress * task.mPercentage
    thisMilestone.progress = thisMilestoneProgress
    thisMilestone.save()

    #update the project's progress
    sectionList = Section.objects.filter(project = thisProject)
    thisProjectProgress = 0
    for section in sectionList:
        thisProjectProgress += section.progress * section.percentage
    thisProject.progress = thisProjectProgress
    thisProject.save()


# def getCommits(developerId, projectId):
def updateProgress(taskId, progress):
    thisTask = Task.objects.get(pk = taskId)
    thisSection = thisTask.section
    thisMilestone = thisTask.milestone
    thisProject = thisSection.project

    #update this task's progress
    thisTask.progress = progress
    thisTask.save()


    #update this section's progress
    taskList = Task.objects.filter(section = thisSection)
    thisSectionProgress = 0
    for task in taskList:
        thisSectionProgress += task.progress * task.percentage
    thisSection.progress = thisSectionProgress
    thisSection.save()

    #update this milestone's progress
    taskList2 = Task.objects.filter(milestone = thisMilestone)
    thisMilestoneProgress = 0
    for task in taskList2:
        thisMilestoneProgress += task.progress * task.mPercentage
    thisMilestone.progress = thisMilestoneProgress
    thisMilestone.save()

    #update the project's progress
    sectionList = Section.objects.filter(project = thisProject)
    thisProjectProgress = 0
    for section in sectionList:
        thisProjectProgress += section.progress * section.percentage
    thisProject.progress = thisProjectProgress
    thisProject.save()







