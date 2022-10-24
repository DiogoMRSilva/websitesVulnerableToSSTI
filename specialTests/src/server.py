from flask import Flask
from insertedInMiddleCodeText import insertedInMiddleCodeText
from insertInMiddleCode import insertInMiddleCode
from nonVulnerable import nonVulnerable
from outputNotAccessible import outputNotAccessible
from resultOtherPage import resultOtherPage

app = Flask(__name__)
app.register_blueprint(insertedInMiddleCodeText, url_prefix='/insertedInMiddleCodeText')
app.register_blueprint(insertInMiddleCode, url_prefix='/insertInMiddleCode')
app.register_blueprint(nonVulnerable, url_prefix='/nonVulnerable')
app.register_blueprint(outputNotAccessible, url_prefix='/outputNotAccessible')
app.register_blueprint(resultOtherPage, url_prefix='/resultOtherPage')


@app.route('/', methods=['GET','POST'])
def index():
	return """
	<!DOCTYPE html><html><body>

<a href="insertedInMiddleCodeText">insertedInMiddleCodeText</a><br>
<a href="insertInMiddleCode">insertInMiddleCode</a><br>
<a href="nonVulnerable">nonVulnerable</a><br>
<a href="outputNotAccessible">outputNotAccessible</a><br>
<a href="resultOtherPage">resultOtherPage</a><br>

</body></html>
	""" 

if __name__=="__main__":
	  app.run("0.0.0.0",port = 6003,debug=False)