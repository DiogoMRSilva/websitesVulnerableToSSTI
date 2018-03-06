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
    <form action="/" method="post">\
      First name:<br>\
      <input type="text" name="name" value="">\
      <input type="submit" value="Submit">\
    </form><h2>Hello %s! </h2></body></html>' % person
    return Template(template).render(data="world")


if __name__=="__main__":
	app.run("0.0.0.0",port = 5001,debug=False)
