# for this we need to install flask
from flask import *
from mako.template import Template


app = Flask(__name__)

@app.route('/',methods=['GET', 'POST'])
def base():
    person = ""
    if request.method == 'POST':
      if request.form['name']:
        person = request.form['name']

	
    template = '<!DOCTYPE html><html><body>\
    <h1>THIS IS NOT VULNERABLE TO SSTI</h1>\
    <br>\
    <form action="/" method="post">\
      First name:<br>\
      <input type="text" name="name" value="">\
      <input type="submit" value="Submit">\
    </form><h2>Hello ${name} </h2></body></html>'
    return Template(template).render(name = person)


if __name__=="__main__":
	app.run("0.0.0.0",port = 6004,debug=False)
