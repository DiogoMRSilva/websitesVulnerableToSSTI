import os.path

fname = "../README.md"
if os.path.isfile(fname):
    markup_file = open(fname,"r")
else:
    markup_file = open("./README.md","r")

lines = markup_file.readlines()
markup_file.close()

html='''<!DOCTYPE html><html><head><style>table {
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
</style></head><body><table>'''

for line in lines:
    if "|" in line:
        splited = line.split("|")
        if len(splited)==10 and ("--" not in line) and ("exploit" not in line):
            if splited[7].strip().isdigit():
                html+='<tr><th><a href="http://127.0.0.1:{0}">{1}</a></td><td>{2}</td></tr>\n'.format(splited[7].strip(),splited[1].strip(),splited[2].strip())

html+="</table></body></html>"

from flask import *
app = Flask(__name__)

@app.route('/all',methods=['GET', 'POST'])
def base():
    return html

@app.route('/',methods=['GET','POST'])
def other():
    return '''<!DOCTYPE html><html><head><style>table {
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
</style></head><body><table><tr><th><a href="http://127.0.0.1:5000">jinja2</a></td><td>Python</td></tr>
<tr><th><a href="http://127.0.0.1:5001">Mako</a></td><td>Python</td></tr>
<tr><th><a href="http://127.0.0.1:5002">Tornado</a></td><td>Python</td></tr>
<tr><th><a href="http://127.0.0.1:5020">Smarty</a></td><td>PHP</td></tr>
<tr><th><a href="http://127.0.0.1:5021">Smarty(secure mode)</a></td><td>PHP</td></tr>
<tr><th><a href="http://127.0.0.1:5022">Twig</a></td><td>PHP</td></tr>
<tr><th><a href="http://127.0.0.1:5051">FreeMarker</a></td><td>Java</td></tr>
<tr><th><a href="http://127.0.0.1:5052">Velocity</a></td><td>Java</td></tr>
<tr><th><a href="http://127.0.0.1:5053">Thymeleaf</a></td><td>Java</td></tr>
<tr><th><a href="http://127.0.0.1:5062">Nunjucks</a></td><td>JavaScript</td></tr>
<tr><th><a href="http://127.0.0.1:5063">doT</a></td><td>JavaScript</td></tr>
<tr><th><a href="http://127.0.0.1:5066">EJS</a></td><td>JavaScript</td></tr>
<tr><th><a href="http://127.0.0.1:5068">vuejs</a></td><td>JavaScript</td></tr>
<tr><th><a href="http://127.0.0.1:5069">jade</a></td><td>Nodejs</td></tr>
<tr><th><a href="http://127.0.0.1:5080">Slim</a></td><td>Ruby</td></tr>
<tr><th><a href="http://127.0.0.1:5081">ERB</a></td><td>Ruby</td></tr>
</table></body></html>'''


if __name__=="__main__":
	app.run("0.0.0.0",port = 4000,debug=False)

