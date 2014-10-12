from django.shortcuts import render_to_response, redirect, render
from django.template import RequestContext
# import requests
import urllib, urllib2
from urllib2 import urlopen, Request
import json
from django.http import HttpResponse, HttpRequest
from django.core import serializers

GITHUB_CLIENT_ID = 'd8d60af4bfa5ebe8bb67'
GITHUB_CLIENT_SECRET = '6c174e8d8e473916f542b1016f808097e43ede99'
GITHUB_REQUEST_PERMISSIONS = ''
homepage = 'http://127.0.0.1:8000'

def index(request):
    return render_to_response('index.html', {'client_id':GITHUB_CLIENT_ID})
    
def login(request):
	
	return render(request, 'myapp/index.html', {"foo": "bar"}, content_type="application/xhtml+xml")
	# return HttpResponse(json.dumps(response_data), content_type="application/json")

def getuserdata(token):
	url = 'https://api.github.com/user'
	# token  = '38a714bbe87eeb4c9e472e7c6cc59d30b8ff2d00'

	request = Request(url)
	request.add_header('Authorization', 'token %s' % token)
	response = urlopen(request)
	# print response
	return response.read()

def auth(request):
	GITHUB_REQUEST_PERMISSIONS = request.GET.__getitem__('code')
	
	url = 'https://github.com/login/oauth/access_token'
	values = { 'client_id':GITHUB_CLIENT_ID, 'client_secret':GITHUB_CLIENT_SECRET, 'code':GITHUB_REQUEST_PERMISSIONS}
	data = urllib.urlencode(values, doseq=True)
	req = urllib2.Request(url, data)
	response = urllib2.urlopen(req)
	the_page = response.read()
	access_token = the_page.split('=', 1)[1].split('&', 1)[0]

	result = getuserdata(access_token)
	print access_token

	# return HttpResponse(json.dumps(result), content_type="application/json")
	return HttpResponse(result)
	# return render_to_response('index.html', {'client_id':GITHUB_CLIENT_ID, 'result':result})
	# return redirect('https://google.com')
