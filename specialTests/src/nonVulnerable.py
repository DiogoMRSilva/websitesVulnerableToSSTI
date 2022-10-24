from flask import Blueprint, request
from mako.template import Template

nonVulnerable = Blueprint('nonVulnerable', __name__)

@nonVulnerable.route('/',methods=['GET', 'POST'])
def base():
    person = ""
    if request.method == 'POST':
      if request.form['name']:
        person = request.form['name']

    template = '<!DOCTYPE html><html><body>\
    <h1>THIS IS NOT VULNERABLE TO SSTI</h1>\
    <br>\
    <form action="" method="post">\
      First name:<br>\
      <input type="text" name="name" value="">\
      <input type="submit" value="Submit">\
    </form><h2>Hello ${name} </h2></body></html>'
    return Template(template).render(name = person)
