from flask import Blueprint, request
from mako.template import Template
import html

makoTemplateWithSimpleFilter = Blueprint('makoTemplateWithSimpleFilter', __name__)

@makoTemplateWithSimpleFilter.route('/',methods=['GET', 'POST'])
def base():
    person = ""
    if request.method == 'POST':
      if request.form['name']:
        person = html.escape(request.form['name'])
	
    template = '<!DOCTYPE html><html><body>\
    <form action="" method="post">\
      First name:<br>\
      <input type="text" name="name" value="">\
      <input type="submit" value="Submit">\
    </form><h2>Hello %s! </h2></body></html>' % person
    return Template(template).render(data="world")

