from flask import Flask
from insertedInMiddleCodeText import insertedInMiddleCodeText
from insertInMiddleCode import insertInMiddleCode
from nonVulnerable import nonVulnerable
from outputNotAccessible import outputNotAccessible
from resultOtherPage import resultOtherPage
from pythonExec import python_exec
from pythonEval import python_eval
from genericTemplate import generic_template
from jinja2Template import jinja2Template
from makoTemplate import makoTemplate
from makoTemplateWithSimpleFilter import makoTemplateWithSimpleFilter# 

app = Flask(__name__)
app.register_blueprint(insertedInMiddleCodeText, url_prefix='/insertedInMiddleCodeText')
app.register_blueprint(insertInMiddleCode, url_prefix='/insertInMiddleCode')
app.register_blueprint(nonVulnerable, url_prefix='/nonVulnerable')
app.register_blueprint(outputNotAccessible, url_prefix='/outputNotAccessible')
app.register_blueprint(resultOtherPage, url_prefix='/resultOtherPage')
app.register_blueprint(python_exec, url_prefix='/python_exec')
app.register_blueprint(python_eval, url_prefix='/python_eval')
app.register_blueprint(generic_template, url_prefix='/generic_template')
app.register_blueprint(jinja2Template, url_prefix='/jinja2')
app.register_blueprint(makoTemplate, url_prefix='/mako')
app.register_blueprint(makoTemplateWithSimpleFilter, url_prefix='/makoWithSimpleFilter')

@app.route('/', methods=['GET','POST'])
def index():
	return """
	<!DOCTYPE html><html><body>

<a href="insertedInMiddleCodeText/">insertedInMiddleCodeText</a><br>
<a href="insertInMiddleCode/">insertInMiddleCode</a><br>
<a href="nonVulnerable/">nonVulnerable</a><br>
<a href="outputNotAccessible/">outputNotAccessible</a><br>
<a href="resultOtherPage/">resultOtherPage</a><br>
<a href="python_exec/">python_exec</a><br>
<a href="python_eval/">python_eval</a><br>
<a href="generic_template/">generic_template</a><br>
<a href="jinja2/">jinja2</a><br>
<a href="mako/">mako</a><br>
<a href="makoWithSimpleFilter/">makoWithSimpleFilter</a><br>

</body></html>
	""" 

if __name__=="__main__":
	  app.run("0.0.0.0",port = 6003,debug=False)