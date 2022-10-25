from flask import Blueprint, request
from mako.template import Template

insertInMiddleCode = Blueprint('insertInMiddleCode', __name__)

@insertInMiddleCode.route('/',methods=['GET', 'POST'])
def base():
    person = "1"
    if request.method == 'POST':
      if request.form['name']:
        person = request.form['name']
	
    template = '<!DOCTYPE html><html><body>\
    <form action="" method="post">\
      Guess the correct number:<br>\
      <input type="text" name="name" value="">\
      <input type="submit" value="Submit">\
    </form><h2> ${1234 == %s}! </h2></body></html>' % person
    return Template(template).render(data="world")
