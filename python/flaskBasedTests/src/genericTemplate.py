from flask import Blueprint, request
import re

generic_template = Blueprint('generic_template', __name__)

basic_template = '<!DOCTYPE html><html> <body>\
		<form action="" method="post">\
			First name:<br>\
			<input type="text" name="name" value="">\
			<input type="submit" value="Submit">\
		</form><h2>Hello %s! </h2></body></html>'

def getResultOfRequestWith(request, regex):
		person = ""
		if request.method == 'POST':
				if request.form['name']:
						person = request.form['name']
						matches = re.finditer(regex, person, re.MULTILINE)
				for matchNum, match in enumerate(matches):
						eval_result = eval(match.group(1))
						person = person.replace(str(match.group()),str(eval_result))
		template = basic_template % person
		return template

@generic_template.route('/curly',methods=['GET', 'POST'])
def curly():
		return getResultOfRequestWith(request, r"{(.*?)}")

@generic_template.route('/dollar_curly',methods=['GET', 'POST'])
def dollar_curly():
		return getResultOfRequestWith(request, r"\${(.*?)}")

@generic_template.route('/double_curly',methods=['GET', 'POST'])
def double_curly():
		return getResultOfRequestWith(request, r"{{(.*?)}}")

@generic_template.route('/less_percentage_equal',methods=['GET', 'POST'])
def less_percentage_equal():
		return getResultOfRequestWith(request, r"<%=(.*?)%>")

@generic_template.route('/hash_curly',methods=['GET', 'POST'])
def hash_curly():
		return getResultOfRequestWith(request, r"#{(.*?)}")

@generic_template.route('/double_curly_equal',methods=['GET', 'POST'])
def double_curly_equal():
		 return getResultOfRequestWith(request, r"{{=(.*?)}}")

@generic_template.route('/', methods=['GET','POST'])
def index():
	return """
	<!DOCTYPE html><html><head><style>table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
}
td, th {
    border: 0.8px solid #dddddd;
    text-align: left;
    padding: 1px;
}
tr:nth-child(even) {
    background-color: #dddddd;
}
</style></head><body>

<a href="curly">curly</a><br>
<a href="dollar_curly">dollar_curly</a><br>
<a href="double_curly">double_curly</a><br>
<a href="less_percentage_equal">less_percentage_equal</a><br>
<a href="hash_curly">hash_curly</a><br>
<a href="double_curly_equal">double_curly_equal</a><br>

</body></html>
	""" 