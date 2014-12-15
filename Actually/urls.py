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
    # url(r'^mainb/', 'Auth_App.views.loginb'),
    url(r'^auth', 'Auth_App.views.auth'),
    url(r'^site_media/(?P<path>.*)$', 'django.views.static.serve', {'document_root':settings.STATIC_PATH}),
    url(r'^site_templates/(?P<path>.*)$', 'django.views.static.serve', {'document_root':settings.STATIC_PATH_TEMPLATES}),
    url(r'^dbservice/', 'Auth_App.dbservice.test'),
	url(r'^testcontri/$','Auth_App.views.expectcal'), 
    url(r'^viewproject/$', 'Auth_App.views.viewproject'),
    url(r'^ajaxtest/$', 'Auth_App.ajaxdata.test'),
    url(r'^jsontest/$', 'Auth_App.jsonservice.get_column_json'),
    url(r'^get_process_json/$', 'Auth_App.jsonservice.get_process_json'),
    url(r'^get_past_due/$', 'Auth_App.jsonservice.get_pastdue_json'),
    url(r'^get_developer_json/$', 'Auth_App.jsonservice.get_developer_json'),
    url(r'^getpmjson/$', 'Auth_App.jsonservice.getpmjson'),
    url(r'^errorpage/$', 'Auth_App.errorhandler.show_error_msg'),
    url(r'^logout/$', 'Auth_App.views.logout'),
    url(r'^test/$', 'Auth_App.views.test'),
    url(r'^addproject/$', 'Auth_App.views.view_setup_project'),
    
 
)

