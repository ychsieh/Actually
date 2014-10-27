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
    url(r'^main2/', 'Auth_App.views.main2'),
    # url(r'^mainb/', 'Auth_App.views.loginb'),
    url(r'^auth', 'Auth_App.views.auth'),
    url(r'^site_media/(?P<path>.*)$', 'django.views.static.serve', {'document_root':settings.STATIC_PATH}),
    url(r'^project1/', 'Auth_App.views.project1'),
    url(r'^project2/', 'Auth_App.views.project2'),
    url(r'^newproject/', 'Auth_App.views.newproject'),
    
    # url(r'^social/', include('socialregistration.urls',
    #             namespace = 'socialregistration'))
)

