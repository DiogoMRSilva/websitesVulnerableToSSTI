from flask import *
app = Flask(__name__)

template = """<!DOCTYPE html><html><body>\
    <h1>Online Calculator</h1>\
    <form action="/" method="post">\
      expression:<br>\
      <input type="text" name="expression" value="">\
      <input type="submit" value="Submit">\
    </form>
    
    <form action="/evalDoubleQuoted" method="post">\
      expression:<br>\
      <input type="text" name="expression" value="">\
      <input type="submit" value="Submit">\
    </form>

    <form action="/evalQuoted" method="post">\
      expression:<br>\
      <input type="text" name="expression" value="">\
      <input type="submit" value="Submit">\
    </form>

    <form action="/evalMiddleMathOp" method="post">\
      expression:<br>\
      <input type="text" name="expression" value="">\
      <input type="submit" value="Submit">\
    </form>
    
    <h2>%s </h2></body></html>"""

@app.route('/',methods=['GET'])
def baseGet():
    return template % "SEND INPUT"

@app.route('/',methods=['POST'])
def base():
    if request.method == 'POST':
      if request.form['expression']:
        expression = request.form['expression']
    result = ""
    try:
      result = eval(expression)
    except:
      result = "error"

    html = template % result
    return html

@app.route('/evalDoubleQuoted',methods=['POST'])
def evalDoubleQuoted():
    if request.method == 'POST':
      if request.form['expression']:
        expression = request.form['expression']
    result = ""
    try:
      result = eval('"lala" + "%s"' % expression)
    except:
      result = "error"

    html = template % result
    return html

@app.route('/evalQuoted',methods=['POST'])
def evalQuoted():
    if request.method == 'POST':
      if request.form['expression']:
        expression = request.form['expression']
    result = ""
    try:
      result = eval("'lala' + '%s'" % expression)
    except:
      result = "error"

    html = template % result
    return html

@app.route('/evalMiddleMathOp',methods=['POST'])
def evalMiddleMathOp():
    if request.method == 'POST':
      if request.form['expression']:
        expression = request.form['expression']
    result = ""
    try:
      result = eval("%s % 7" % expression)
    except:
      result = "error"

    html = template % result
    return html

if __name__=="__main__":
	app.run("0.0.0.0",port = 5004,debug=False)
