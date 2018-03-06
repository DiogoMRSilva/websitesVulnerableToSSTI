//Same for all javascritp template tengines
const express = require('express')
var bodyParser = require('body-parser');
const app = express()
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

var requireFromString = require('require-from-string');


//Dependent of Templating engine
var markoCompiler = require('marko/compiler');
const port = 5064


function getHTML(input){

    /*var template =`
    <!DOCTYPE html><html><body>
    <form action="/" method="post">
        First name:<br>
    <input type="text" name="name" value="">
    <input type="submit" value="Submit">
    </form><p>Hello `+input+`</p></body></html>`;
    var template =`
    class {
        sayHi() {
            alert('Hi!');
        }
    }
     
    <button on-click('sayHi')>Click me!</button>
    
    `;
    var view = requireFromString(template);
    var html = view.renderToString({});*/

    var html = "<!DOCTYPE html><html><body><h1>this server is not working properly</h1></body></html>"
    return html;
}


app.post('/', (request, response) => {
    var input = request.param('name', "")
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

