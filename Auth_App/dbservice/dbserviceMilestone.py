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

def findMilestonsByDeveloperProject(developerId, projectId):
    milestones = Milestone.objects.filter(project = projectId, developer = developerId)
    return milestones