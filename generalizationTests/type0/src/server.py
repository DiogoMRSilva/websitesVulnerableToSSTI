# for this we need to install flask
from flask import *
import re


app = Flask(__name__)

@app.route('/',methods=['GET', 'POST'])
def base():
    person = ""
    if request.method == 'POST':
      if request.form['name']:
        person = request.form['name']
        regex = r"{([^}]*)}"
        matches = re.finditer(regex, person, re.MULTILINE)
        for matchNum, match in enumerate(matches):
            eval_result = eval(match.group(1))
            person = person.replace(str(match.group()),str(eval_result))

	
    template = '<!DOCTYPE html><html><body>\
    <form action="/" method="post">\
      First name:<br>\
      <input type="text" name="name" value="">\
      <input type="submit" value="Submit">\
    </form><h2>Hello %s! </h2></body></html>' % person
    return template


if __name__=="__main__":
	app.run("0.0.0.0",port = 5000,debug=False)
