from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'Actually.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
    url(r'^$', 'Auth_App.views.index'),
    url(r'^login/', 'Auth_App.views.login'),
    url(r'^auth', 'Auth_App.views.auth'),
    
    # url(r'^social/', include('socialregistration.urls',
    #             namespace = 'socialregistration'))
)

