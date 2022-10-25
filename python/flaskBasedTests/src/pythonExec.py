from flask import Blueprint, request

python_exec = Blueprint('python_exec', __name__)

template = '<!DOCTYPE html><html><body>\
    <h1>Online Calculator</h1>\
    <form action="" method="post">\
      expression:<br>\
      <input type="text" name="expression" value="">\
      <input type="submit" value="Submit">\
    </form><h2>%s </h2></body></html>'

@python_exec.route('/',methods=['GET'])
def base():
    return template % "SEND INPUT"

@python_exec.route('/',methods=['POST'])
def base2():
    expression = ""
    if request.form['expression']:
      expression = request.form['expression']
    result = ""
    try:
      exec("result =("+expression+")")
    except:
      result = "error"

    html = template % result
    return html
