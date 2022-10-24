from flask import Blueprint, request

python_eval = Blueprint('python_eval', __name__)

template = """<!DOCTYPE html><html><body>\
    <h1>Online Calculator</h1>\
    <form action="" method="post">\
      expression:<br>\
      <input type="text" name="expression" value="">\
      <input type="submit" value="Submit">\
    </form>
    
    <form action="evalDoubleQuoted" method="post">\
      expression:<br>\
      <input type="text" name="expression" value="">\
      <input type="submit" value="Submit">\
    </form>

    <form action="evalQuoted" method="post">\
      expression:<br>\
      <input type="text" name="expression" value="">\
      <input type="submit" value="Submit">\
    </form>

    <form action="evalMiddleMathOp" method="post">\
      expression:<br>\
      <input type="text" name="expression" value="">\
      <input type="submit" value="Submit">\
    </form>
    
    <h2>%s </h2></body></html>"""


@python_eval.route('/',methods=['GET', 'POST'])
def base():
    if request.method == 'GET':
      return template % "SEND INPUT"
    
    expression = ""
    if request.form['expression']:
        expression = request.form['expression']
    result = ""
    try:
      result = eval(expression)
    except:
      result = "error"

    html = template % result
    return html

@python_eval.route('/evalDoubleQuoted',methods=['POST'])
def evalDoubleQuoted():
    expression = ""
    if request.form['expression']:
        expression = request.form['expression']
    result = ""
    try:
      result = eval('"lala" + "%s"' % expression)
    except:
      result = "error"

    html = template % result
    return html

@python_eval.route('/evalQuoted',methods=['POST'])
def evalQuoted():
    expression = ""
    if request.form['expression']:
        expression = request.form['expression']
    result = ""
    try:
      result = eval("'lala' + '%s'" % expression)
    except:
      result = "error"

    html = template % result
    return html

@python_eval.route('/evalMiddleMathOp',methods=['POST'])
def evalMiddleMathOp():
    expression = ""
    if request.form['expression']:
        expression = request.form['expression']
    result = ""
    try:
      result = eval("%s % 7" % expression)
    except:
      result = "error"

    html = template % result
    return html
