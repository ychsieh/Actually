from django.contrib import admin
from Auth_App.models import PM, Developer, Project, Section, Task, Milestone, Commit
# Register your models here.
admin.site.register(PM)
admin.site.register(Project)
admin.site.register(Developer)
admin.site.register(Section)
admin.site.register(Task)
admin.site.register(Milestone)
admin.site.register(Commit)
