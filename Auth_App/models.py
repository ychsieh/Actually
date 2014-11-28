from django.db import models
import datetime
from django.utils import timezone

# Create your models here.
# Users include developers and product managers
# give github name , return projects
# give project , return all users, and pm( at top of list)
# give a github name, return all milestones 

class Project(models.Model):
	name = models.CharField(max_length = 100)
	description = models.CharField(max_length = 1000, null = True, blank = True)
	startTime = models.DateField('date the project starts')
	finishTime = models.DateField('date the project finishes', null = True, blank = True)
	progress = models.FloatField(default = 0)
	prevProgress =models.FloatField(default = 0)
	repo = models.CharField(max_length = 100, null = True)
	repoOwner = models.CharField(max_length = 100, null = True, blank = True)
	optional1 = models.CharField(max_length = 100, null = True, blank = True)
	optional2 = models.CharField(max_length = 100, null = True, blank = True)
	optional3 = models.CharField(max_length = 100, null = True, blank = True)

	def __unicode__(self):
		return self.name


class PM(models.Model):
	firstName = models.CharField(max_length = 50)
	lastName = models.CharField(max_length = 50)
	githubName = models.CharField(max_length =50,default = 0)
	project = models.ManyToManyField(Project, null = True, blank = True)
	optional1 = models.CharField(max_length = 100, null = True, blank = True)
	optional2 = models.CharField(max_length = 100, null = True, blank = True)
	optional3 = models.CharField(max_length = 100, null = True, blank = True)

	def __unicode__(self):
		return '{} {}'.format(self.firstName, self.lastName)



class Developer(models.Model):
	firstName = models.CharField(max_length = 50)
	lastName = models.CharField(max_length = 50)
	githubName = models.CharField(max_length =50)
	pmAssigned = models.ForeignKey(PM, null = True, blank = True)
	project = models.ManyToManyField(Project, null = True, blank = True)
	optional1 = models.CharField(max_length = 100, null = True, blank = True)
	optional2 = models.CharField(max_length = 100, null = True, blank = True)
	optional3 = models.CharField(max_length = 100, null = True, blank = True)

	def __unicode__(self):
		return '{} {}'.format(self.firstName, self.lastName)


class Milestone(models.Model):
	name = models.CharField(max_length = 100)
	description = models.CharField(max_length = 1000, null = True, blank = True)
	progress = models.FloatField(default = 0)
	prevProgress = models.FloatField(default = 0)
	percentage = models.FloatField(null = True)
	dueDate = models.DateField()
	project = models.ForeignKey(Project)
	developer = models.ManyToManyField(Developer)
	optional1 = models.CharField(max_length = 100, null = True, blank = True)
	optional2 = models.CharField(max_length = 100, null = True, blank = True)
	optional3 = models.CharField(max_length = 100, null = True, blank = True)


	def __unicode__(self):
		return self.name


class Section(models.Model):
	name = models.CharField(max_length = 100)
	description = models.CharField(max_length = 1000, null = True, blank = True)
	percentage = models.FloatField('the percentage in the the project')
	progress = models.FloatField(default = 0)
	prevProgress = models.FloatField(default = 0)
	developer = models.OneToOneField(Developer, null = True, blank = True)
	project = models.ForeignKey(Project, null = True)
	optional1 = models.CharField(max_length = 100, null = True, blank = True)
	optional2 = models.CharField(max_length = 100, null = True, blank = True)
	optional3 = models.CharField(max_length = 100, null = True, blank = True)


	def __unicode__(self):
		return self.name


class Task(models.Model):
	name = models.CharField(max_length = 100)
	description = models.CharField(max_length = 1000, null = True, blank = True)
	percentage = models.FloatField('the percentage in the the section')
	progress = models.FloatField(default = 0)
	prevProgress = models.FloatField(default = 0)
	section = models.ForeignKey(Section)
	milestone = models.ForeignKey(Milestone)
	developer = models.ForeignKey(Developer,null = True, blank = True)
	optional1 = models.CharField(max_length = 100, null = True, blank = True)
	optional2 = models.CharField(max_length = 100, null = True, blank = True)
	optional3 = models.CharField(max_length = 100, null = True, blank = True)
	
	def __unicode__(self):
		return self.name

class Commit(models.Model):
	commitTime = models.DateTimeField()
	# progress = models.FloatField()
	developer = models.ForeignKey(Developer)
	project = models.ForeignKey(Project)
	task = models.ForeignKey(Task)
	# linescode = models.CharField(max_length = 1000, null = True, blank = True)
	# commitmessage = models.CharField(max_length = 1000, null = True, blank = True)

	# def __unicode__(self):
	# 	return '{} {} {} {:.2f} {}'.format(self.developer.firstName, self.developer.lastName, 
	# 		self.task.name, self.progress, self.commitTime)

class Extensibility(models.Model):
	commit = models.ForeignKey(Commit)
	task = models.ForeignKey(Task)
	attribute = models.CharField(max_length = 100)
	value = models.CharField(max_length = 100)






















