from django.shortcuts import render, render_to_response
from Auth_App.models import Project, PM, Developer, Milestone, Section, Task, Commit
from django.http import HttpResponse, HttpResponseRedirect
from itertools import chain

def addProject(inputName, inputdescription, inputstarttime,
    inputfinishtime,inputprogress,inputprevProgress,inputrepo,inputrepoOwner,
    inputoptional1,inputoptional2,inputoptional3):

    project = Project(name = inputName,description = inputdescription
        ,startTime = inputstarttime,finishTime = inputfinishtime,
        progress = inputprogress, prevProgress = inputprevProgress,repo = inputrepo
        ,repoOwner = inputrepoOwner,optional1 = inputoptional1
        ,optional2 = inputoptional2,optional3 = inputoptional3)
    project.save()

def addPM(inputfirstName,inputlastName,inputgithubName,GivenProject,inputoptional1,inputoptional2,inputoptional3):

    newPM = PM(firstName = inputfirstName,lastName = inputlastName,githubName = inputgithubName,
        optional1 = inputoptional1,optional2 = inputoptional2,optional3 = inputoptional3)
    newPM.save()
    newPM.project.add(GivenProject)

def addDeveloper(inputfirstName,inputlastName,inputgithubName,GivenPM,GivenProject,inputoptional1,inputoptional2,inputoptional3):

    newDeveloper = Developer(firstName = inputfirstName,lastName = inputlastName,githubName = inputgithubName,
        optional1 = inputoptional1,optional2 = inputoptional2,optional3 = inputoptional3)
    newDeveloper.pmAssigned=GivenPM

    newDeveloper.save()
    newDeveloper.project.add(GivenProject)



def addMilestone(inputname,inputdescription,inputprogress,inputpercentage,inputduedate,Givenproject,Givendeveloper,inputoptional1,inputoptional2,inputoptional3):

    newMilestone =Milestone(name = inputname,description = inputdescription,progress=inputprogress,
        prevProgress = 0, percentage=inputpercentage,dueDate=inputduedate,optional1 = inputoptional1,optional2 = inputoptional2,optional3 = inputoptional3)

    newMilestone.project=Givenproject
    newMilestone.save()
    newMilestone.developer.add(Givendeveloper)



def addSection(inputname,inputdescription,inputprogress,inputpercentage,Givenproject,Givendeveloper,inputoptional1,inputoptional2,inputoptional3):

    newSection = Section(name = inputname,description = inputdescription,progress=inputprogress,
        prevProgress = 0, percentage=inputpercentage,optional1 = inputoptional1,optional2 = inputoptional2,optional3 = inputoptional3)
    newSection.project=Givenproject
    newSection.developer=Givendeveloper
    newSection.save()

def addTask(inputname,inputdescription,inputprogress,inputpercentage,Givensection,Givendeveloper,Givenmilestone
    ,inputoptional1,inputoptional2,inputoptional3):

    newTask=Task(name = inputname,description = inputdescription,progress=inputprogress,
        prevProgress=0,percentage=inputpercentage,optional1 = inputoptional1,optional2 = inputoptional2,optional3 = inputoptional3)

    newTask.section=Givensection
    newTask.developer=Givendeveloper
    newTask.milestone=Givenmilestone
    newTask.save()

def addCommit(inputtime,Givendeveloper,Givenproject,Giventask):

    newCommit=Commit(commitTime = inputtime)

    newCommit.project=Givenproject
    newCommit.developer=Givendeveloper
    newCommit.task=Giventask
    newCommit.save()

    
def addExtensibility(inputattribute,inputvalue,Givencommit,Giventask):

    newExtensibility=Extensibility(attribute =inputattribute,value=inputvalue)

    newExtensibility.commit=Givencommit
    newExtensibility.task=Giventask
    newExtensibility.save()