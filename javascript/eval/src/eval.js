//Same for all javascritp template tengines
const express = require('express')
var bodyParser = require('body-parser');
const app = express()
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: true
}));

//Dependent of Templating engine
const port = 5067


function getHTML(result) {
    return `
    <!DOCTYPE html><html><body>
    <h2>Eval as received</h2>
    <form action="/" method="post">
      expression:<br>
      <input type="text" name="expression" value="">
      <input type="submit" value="Submit">
    </form> <br>

    <h2>Eval Inside Double Quote</h2>
    <form action="/evalInsideDoubleQuote" method="post">
      expression:<br>
      <input type="text" name="expression" value="">
      <input type="submit" value="Submit">
    </form> <br>

    <h2>Eval Inside Single Quote</h2>
    <form action="/evalInsideSingleQuote" method="post">
      expression:<br>
      <input type="text" name="expression" value="">
      <input type="submit" value="Submit">
    </form> <br>

    <h2>Eval Inside Existing Code</h2>
    <form action="/evalInsideExistingCode" method="post">
      expression:<br>
      <input type="text" name="expression" value="">
      <input type="submit" value="Submit">
    </form> <br>

    <h2>Eval Blind</h2>
    <form action="/evalBlind" method="post">
      expression:<br>
      <input type="text" name="expression" value="">
      <input type="submit" value="Submit">
    </form> <br>

    <h1>Result</h1>
    <h2> ${result}</h2></body></html>`
}

app.get('/', (request, response) => {
    response.send(getHTML(""))
})

app.post('/', (request, response) => {
    var input = request.param('expression', "")
    var result = ""
    if (input != undefined && input != "") {
        result = input + ' = ' + eval(input);
    }
    var html = getHTML(result)
    response.send(html);
})

app.post('/evalInsideDoubleQuote', (request, response) => {
    var input = request.param('expression', "")
    var result = ""
    if (input != undefined && input != "") {
        result = eval(`"${input}"`);
    }
    var html = getHTML(result)
    response.send(html);
})

app.post('/evalInsideSingleQuote', (request, response) => {
    var input = request.param('expression', "")
    var result = ""
    if (input != undefined && input != "") {
        result = eval(`'${input}'`);
    }
    var html = getHTML(result)
    response.send(html);
})

app.post('/evalInsideExistingCode', (request, response) => {
    var input = request.param('expression', "")
    var result = ""
    if (input != undefined && input != "") {
        result = eval(`var x = ${input}; x;`);
    }
    var html = getHTML(result)
    response.send(html);
})

app.post('/evalBlind', (request, response) => {
    var input = request.param('expression', "")
    eval(input)
    response.send(getHTML(""));
})

app.listen(port, (err) => {
    if (err) {
        return console.log('something bad happened', err)
    }

    console.log(`server is listening on ${port}`)
})