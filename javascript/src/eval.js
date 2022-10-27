
function getHTML(result) {
    return `
    <!DOCTYPE html><html><body>
    <h2>Eval as received</h2>
    <form action="simple" method="post">
      expression:<br>
      <input type="text" name="expression" value="">
      <input type="submit" value="Submit">
    </form> <br>

    <h2>Eval Inside Double Quote</h2>
    <form action="evalInsideDoubleQuote" method="post">
      expression:<br>
      <input type="text" name="expression" value="">
      <input type="submit" value="Submit">
    </form> <br>

    <h2>Eval Inside Single Quote</h2>
    <form action="evalInsideSingleQuote" method="post">
      expression:<br>
      <input type="text" name="expression" value="">
      <input type="submit" value="Submit">
    </form> <br>

    <h2>Eval Inside Existing Code</h2>
    <form action="evalInsideExistingCode" method="post">
      expression:<br>
      <input type="text" name="expression" value="">
      <input type="submit" value="Submit">
    </form> <br>

    <h2>Eval Blind</h2>
    <form action="evalBlind" method="post">
      expression:<br>
      <input type="text" name="expression" value="">
      <input type="submit" value="Submit">
    </form> <br>

    <h1>Result</h1>
    <h2> ${result}</h2></body></html>`
}

module.exports = function(app, basePath){
    app.get(basePath + '/', (request, response) => {
        response.send(getHTML(""))
    })

    app.post(basePath + '/simple', (request, response) => {
        var input = request.param('expression', "")
        var result = ""
        if (input != undefined && input != "") {
            result = input + ' = ' + eval(input);
        }
        var html = getHTML(result)
        response.send(html);
    })

    app.post(basePath + '/evalInsideDoubleQuote', (request, response) => {
        var input = request.param('expression', "")
        var result = ""
        if (input != undefined && input != "") {
            result = eval(`"${input}"`);
        }
        var html = getHTML(result)
        response.send(html);
    })

    app.post(basePath + '/evalInsideSingleQuote', (request, response) => {
        var input = request.param('expression', "")
        var result = ""
        if (input != undefined && input != "") {
            result = eval(`'${input}'`);
        }
        var html = getHTML(result)
        response.send(html);
    })

    app.post(basePath + '/evalInsideExistingCode', (request, response) => {
        var input = request.param('expression', "")
        var result = ""
        if (input != undefined && input != "") {
            result = eval(`var x = ${input}; x;`);
        }
        var html = getHTML(result)
        response.send(html);
    })

    app.post(basePath + '/evalBlind', (request, response) => {
        var input = request.param('expression', "")
        eval(input)
        response.send(getHTML(""));
    })
}