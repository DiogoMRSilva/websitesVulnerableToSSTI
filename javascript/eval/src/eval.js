//Same for all javascritp template tengines
const express = require('express')
var bodyParser = require('body-parser');
const app = express()
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

//Dependent of Templating engine
const port = 5067


function getHTML(input){
    console.log(input);
    var html =`
    <!DOCTYPE html><html><body>
    <h1>Online Calculator</h1>
    <form action="/" method="post">
      expression:<br>
      <input type="text" name="expression" value="">
      <input type="submit" value="Submit">
    </form><h2>`
    if (input!=undefined && input!=""){
        html+=input+' = '+ eval(input);
    }
    html+='</h2></body></html>'

    return html;
}


app.post('/', (request, response) => {
    var input = request.param('expression', "")
    var html = getHTML(input)
    response.send(html);
})


app.get('/', (request, response) => {
    var html = getHTML("")
    response.send(html)
  })


app.listen(port, (err) => {
if (err) {
    
    return console.log('something bad happened', err)
}

console.log(`server is listening on ${port}`)
})

