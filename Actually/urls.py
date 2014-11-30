from django.conf.urls import patterns, include, url
from django.conf import settings

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'Actually.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),	
    url(r'^admin/', include(admin.site.urls)),
    url(r'^$', 'Auth_App.views.index'),
    url(r'^main/', 'Auth_App.views.main'),
    # url(r'^mainb/', 'Auth_App.views.loginb'),
    url(r'^auth', 'Auth_App.views.auth'),
    url(r'^site_media/(?P<path>.*)$', 'django.views.static.serve', {'document_root':settings.STATIC_PATH}),
    url(r'^site_templates/(?P<path>.*)$', 'django.views.static.serve', {'document_root':settings.STATIC_PATH_TEMPLATES}),
    url(r'^project1/', 'Auth_App.views.project1'),
    url(r'^project2/', 'Auth_App.views.project2'),
    url(r'^newproject/', 'Auth_App.views.newproject'),
    url(r'^testerror/', 'Auth_App.views.error'),
    url(r'^testsenddata/', 'Auth_App.views.newProjectData'),
    url(r'^dbservice/', 'Auth_App.dbservice.test'),
    url(r'^test/', 'Auth_App.views.test'),
    url(r'^viewproject/$', 'Auth_App.views.viewproject'),
    url(r'^ajaxtest/$', 'Auth_App.ajaxdata.test'),
    url(r'^jsontest/$', 'Auth_App.jsonservice.test'),
    url(r'^getpmjson/$', 'Auth_App.jsonservice.getpmjson'),
    url(r'^testexpect/', 'Auth_App.views.expectcal'),

                       
 
)

