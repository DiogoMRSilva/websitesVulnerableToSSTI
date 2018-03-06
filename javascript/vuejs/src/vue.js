//Same for all javascritp template tengines
const express = require('express')
var bodyParser = require('body-parser');
const app = express()
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

//Dependent of Templating engine
const Vue = require('vue');
const renderer = require('vue-server-renderer').createRenderer()
const port = 5068


function getHTML(input){
    var pre_template =`<!DOCTYPE html><html><body>
    <form action="/" method="post">
        First name:<br>
    <input type="text" name="name" value="">
    <input type="submit" value="Submit">
    </form><p>Hello `+input+`</p></body></html>`

    var app = new Vue({template: pre_template })

    var html= "";
    renderer.renderToString(app, (err, result) => {
        if (err) throw err
        html = result;
        })
    console.log(input);
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

