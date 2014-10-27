from django.shortcuts import render_to_response, redirect, render
from django.template import RequestContext
# import requests
import urllib, urllib2
from urllib2 import urlopen, Request
import json
# from django.utils import simplejson
from django.http import HttpResponse, HttpRequest
from django.core import serializers


GITHUB_CLIENT_ID = 'd8d60af4bfa5ebe8bb67'
GITHUB_CLIENT_SECRET = '6c174e8d8e473916f542b1016f808097e43ede99'
scope = 'user,repo'
homepage = 'http://127.0.0.1:8000'
access_token = ''

def index(request):
    # print request.GET.path
    return render_to_response('landing.html', {'client_id':GITHUB_CLIENT_ID, 'scope':scope})

def project1(request):
    return render_to_response('Project.html')

def project2(request):
    return render_to_response('Project2.html')

def newproject(request):
    return render_to_response('forms.html')
    
def main(request):
	
	return render_to_response('index.html')
	# return render(request, 'myapp/index.html', {"foo": "bar"}, content_type="application/xhtml+xml")
	# return HttpResponse(json.dumps(response_data), content_type="application/json")

def main2(request):
	
	return render_to_response('indexb.html')

def getCommits(owner, repo):
	global access_token
	url = 'https://api.github.com/repos/'+owner+'/'+repo+'/commits'
	
	request = Request(url)
	request.add_header('Authorization', 'token %s' % access_token)
	response = urlopen(request)
	result = json.load(response)
	# print result
	result = result[0]['commit']['message']
	# result = result.split(' ', 3)[1]
	# test = response

	# if type(test) is list:
	# 	print "List!!"
	# elif type(test) is dict: 
	# 	print "Dict!"
	# elif type(test) is str:
	# 	print "Str!"
	# else:
	# 	print "None of above!"	

	return result

def getStats():
	global access_token
	url = 'https://api.github.com/repos/sinkerplus/Actually/stats/contributors'

	request = Request(url)
	request.add_header('Authorization', 'token %s' % access_token)
	response = urlopen(request)
	result = response.read()

	return result

def auth(request):
	global access_token
	GITHUB_REQUEST_PERMISSIONS = request.GET.__getitem__('code')
	
	url = 'https://github.com/login/oauth/access_token'
	values = { 'client_id':GITHUB_CLIENT_ID, 'client_secret':GITHUB_CLIENT_SECRET, 'code':GITHUB_REQUEST_PERMISSIONS}
	data = urllib.urlencode(values, doseq=True)
	req = urllib2.Request(url, data)
	response = urllib2.urlopen(req)
	the_page = response.read()
	# access_token = json.loads(the_page)
	access_token = the_page.split('=', 1)[1].split('&', 1)[0]

	result = getCommits('sinkerplus', 'Actually')
	# result = getStats()

	return render_to_response('index.html')
	# return HttpResponse(json.dumps(result), content_type="application/json")
	# return HttpResponse(result)
	# return render_to_response('index.html', {'client_id':GITHUB_CLIENT_ID, 'result':result})
	# return redirect('https://google.com')
