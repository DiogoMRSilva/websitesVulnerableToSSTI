# for this we need to install flask
from flask import *
app = Flask(__name__)

@app.route('/',methods=['GET', 'POST'])
def base():
    expression = "1+1"
    if request.method == 'POST':
      if request.form['expression']:
        expression = request.form['expression']
    result = ""
    try:
      exec("result =("+expression+")")
    except:
      result = "error"

    
  
    template = '<!DOCTYPE html><html><body>\
    <h1>Online Calculator</h1>\
    <form action="/" method="post">\
      expression:<br>\
      <input type="text" name="expression" value="">\
      <input type="submit" value="Submit">\
    </form><h2>'+expression+' = %s </h2></body></html>' % result
    return template


if __name__=="__main__":
	app.run("0.0.0.0",port = 5005,debug=False)
