# for this we need to install flask
from flask import *
from mako.template import Template


app = Flask(__name__)

@app.route('/',methods=['GET', 'POST'])
def base():
    person = ""
    message = ""
    if request.method == 'POST':
      if request.form['name']:
        person = request.form['name']
        message = "reclamation sent!" 
	
    reclamation = '<!DOCTYPE html><html><body>\
        complaint: %s </h2></body></html>' % person

    template = '<!DOCTYPE html><html><body>\
    <form action="/" method="post">\
      Complaint:<br>\
      <input type="text" name="name" value="">\
      <input type="submit" value="Submit">\
    </form><h2>%s</h2></body></html>' % message
    
    email_to_admin = Template(reclamation).render()
    
    return template


if __name__=="__main__":
	app.run("0.0.0.0",port = 5001,debug=False)
