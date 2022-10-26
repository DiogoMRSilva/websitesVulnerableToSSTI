var requireFromString = require('require-from-string');
var markoCompiler = require('marko/compiler');
//TODO FIX THIS

function getHTML(input){

    /*var template =`
    <!DOCTYPE html><html><body>
    <form action="" method="post">
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


