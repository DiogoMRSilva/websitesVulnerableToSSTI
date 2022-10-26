from django.http import HttpResponse
#from django import Engine

from django.template import Engine
from django.template import Context, Template
from django.template import RequestContext
#to disable csrf check
from django.views.decorators.csrf import csrf_exempt


@csrf_exempt
def index(request):
    person = request.POST.get('name', "")
    if person == "":
        person = request.GET.get('name', "")

    template_code = '<!DOCTYPE html><html><body>\
    <form action="" method="post">\
      First name:<br>\
      <input type="text" name="name" value="">\
      <input type="submit" value="Submit">\
    </form><h2>Hello '+person+'</h2></body></html>'

    engine = Engine()
    template = engine.from_string(template_code=template_code)
    context = RequestContext(request)
    context.push({"name": "Adrian"})
    return HttpResponse(template.render(context))