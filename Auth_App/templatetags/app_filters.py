from django import template
register = template.Library()

@register.filter(name='mymod')
def mymod(num, val):
    return num % val == 0