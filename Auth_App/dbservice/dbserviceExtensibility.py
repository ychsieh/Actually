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

def findPmByProject(GivenProject):
		findProject = Project.objects.filter(name = GivenProject)
		if (len(findProject) != 0):
			PmName= PM.objects.filter(project =findProject)
			return PmName
		else:
			print 'no PM found by project'

def findDevelopersByProjectId(pid):
    _project = Project.objects.filter(id = pid)
    developers = Developer.objects.filter(project = _project)
    return developers

def findProjectByPM(GivenPMID):
	findPM = PM.objects.get(id = GivenPMID)
	findProject = findPM.project.all()
	if (len(findProject) != 0):
		return findProject
	else:
		print []


def findProjectByDeveloper(GivenDeveloperID):
	findDeveloper = Developer.objects.get(id = GivenDeveloperID)
	findProject = findDeveloper.project.all()
	if(len(findProject) != 0):
		return findProject
	else:
		print []

def findMilestonsByDeveloperProject(developerId, projectId):
    milestones = Milestone.objects.filter(project = projectId, developer = developerId)
    return milestones



def findSectionByMilestoneID(milestoneID):
	findSectionByMilestone = Section.objects.filter(milestone = milestoneID)
	if (len(findSectionByMilestone) != 0):
		return findSectionByMilestone
	else:
		print 'error happening'


def findTasksBySectionID(sectionID):
    tasks = Task.objects.filter(section = sectionID)
    return tasks

def findSectionByProjectIDDeveloperID(projectID,developerID):
    section = Section.objects.get(project = projectID, developer = developerID)
    return section


def findLinesofCodebyProjectIDDeverloperID(projectID, developerID):
	commit = Commit.objects.get(project = projectID, developer = developerID)
	return commit.linescode

def findCommitMessagebyProjectIDDeverloperID(projectID, developerID):
	commit = Commit.objects.get(project = projectID, developer = developerID)
	return commit.commitmessage

def findCommitTimebyProjectIDDeverloperID(projectID, developerID):
	commit = Commit.objects.get(project = projectID, developer = developerID)
	return commit.commitTime

def findProjectById(pid):
    return Project.objects.get(id = pid)


