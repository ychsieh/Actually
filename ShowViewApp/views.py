from django.shortcuts import render_to_response, redirect, render
from django.template import RequestContext

# Create your views here.
def notFound(request):
    return render_to_response('error.html',{'msg':'sorry can not found the page(404 ERROR)'})