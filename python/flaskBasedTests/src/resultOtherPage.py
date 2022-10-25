from flask import Blueprint, request
from mako.template import Template

resultOtherPage = Blueprint('resultOtherPage', __name__)

@resultOtherPage.route('/',methods=['GET', 'POST'])
def base():
    person = ""
    message = ""
    if request.method == 'POST':
      if request.form['name']:
        person = request.form['name']
        message = "Your name have been saved"
        f = open("storage.txt", "w")
        f.write(person)
        f.close()
	
    template = '<!DOCTYPE html><html><body>\
    <form action="" method="post">\
      First name:<br>\
      <input type="text" name="name" value="">\
      <input type="submit" value="Submit">\
    </form><h2>%s </h2>\
    <a href="stored">Check stored name.</a>\
    </body></html>' % message


    return Template(template).render(data="world")

@resultOtherPage.route('/stored',methods=['GET', 'POST'])
def stored():
    f = open("storage.txt", "r")
    name = f.read()
    f.close()
	
    template = '<!DOCTYPE html><html><body>\
    </form><h2>Stored name: %s </h2>\
    </body></html>' % name
    return Template(template).render(data="world")
