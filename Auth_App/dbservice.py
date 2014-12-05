from django.shortcuts import render, render_to_response
from Auth_App.models import Project, PM, Developer, Milestone, Section, Task, Commit
from django.http import HttpResponse, HttpResponseRedirect
from itertools import chain

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

def findProjectByPM(GivegithubName):
    PMs = PM.objects.filter(githubName = GivegithubName)
    projects = []
    for pm in PMs:
        for i in pm.project.all():
            projects.append(i)
    return projects


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

def findTasksByProjectID(projectID):
	sections = findSectionsByProjectID(projectID)
	alltasks = []

	for section in sections:
		tasks = Task.objects.filter(section = section)
    	for task in tasks:
    		alltasks.append(task)
	return alltasks

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

def findSectionsByProjectID(projectID):
	project = Project.objects.get(pk = projectID)
	sections = Section.objects.filter(project = project)
	return sections


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

def getDeveloperBygithubName(GitHubName):
    developer = Developer.objects.get(githubName = GitHubName)
    return developer

def test(request):
	tasks = findTaskByProject(1)
	#tasks = findSectionsByProjectID(1)
	return render_to_response('test.html',{'test':tasks})

def addProject(inputName, inputdescription, inputstarttime,
    inputfinishtime,inputprogress,inputrepo,inputrepoOwner,
    inputoptional1,inputoptional2,inputoptional3):

    project = Project(name = inputName,description = inputdescription
        ,startTime = inputstarttime,finishTime = inputfinishtime,
        progress = inputprogress, prevProgress = 0,repo = inputrepo
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



def findTaskByProject(projectId):
    project = Project.objects.get(pk = projectId)
    sections = Section.objects.filter(project = project)
    tasklist = []
    for section in sections:
        task = Task.objects.filter(section = section)
        for itask in task:
            tasklist.append(itask)
    return tasklist

def findSectionByProject(projectId):
    project = Project.objects.get(pk = projectId)
    sections = Section.objects.filter(project = project)
    return sections

def findDeveloperByProject(projectId):
    project = Project.objects.get(pk = projectId)
    developer = Developer.objects.filter(project = project)
    return developer

def findDeveloperByTask(taskId):
    task = Task.objects.get(pk = taskId)
    developer = task.developer
    return developer

