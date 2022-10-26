const Vue = require('vue');
const renderer = require('vue-server-renderer').createRenderer()

function getHTML(input){
    var pre_template =`<!DOCTYPE html><html><body>
    <form action="" method="post">
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

module.exports = function(app, basePath){
    app.post(basePath + '/', (request, response) => {
        var input = request.param('name', "")
        var html = getHTML(input)
        response.send(html);
    })

    app.get(basePath + '/', (request, response) => {
        var html = getHTML("")
        response.send(html)
    })
}

