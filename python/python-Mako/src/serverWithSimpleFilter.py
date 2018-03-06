# for this we need to install flask
from flask import *
from mako.template import Template
import html


app = Flask(__name__)

@app.route('/',methods=['GET', 'POST'])
def base():
    person = ""
    if request.method == 'POST':
      if request.form['name']:
        person = html.escape(request.form['name'])
	
    template = 'Hello %s!' % person
    return Template(template).render(data="world")

if __name__=="__main__":
	app.run("0.0.0.0",port = 6001,debug=False)
