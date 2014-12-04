from django.shortcuts import render_to_response, redirect, render
from django.template import RequestContext



def show_error_msg(request):
    msg = request.POST.get("msg")
    return render_to_response('error.html',{'msg': msg})
    if msg == None:
        msg = request.POST.get("msg")
    return render_to_response('error.html',{'msg': msg})