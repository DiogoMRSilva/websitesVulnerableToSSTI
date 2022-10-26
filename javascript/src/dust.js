var dust = require('dustjs-linkedin');
var dust = require('dustjs-helpers');
dust.debugLevel="DEBUG";

function getHTML(input){
    console.log(input);
    var template =`<!DOCTYPE html><html><body>
    <form action="" method="post">
        First name:<br>
    <input type="text" name="name" value="">
    <input type="submit" value="Submit">
    </form><p>Hello `+input+`</p></body></html>`

    var compiled = dust.compile(template, 'hello');
    dust.loadSource(compiled);
    dust.render('hello', { name: "Venus" }, function(err, out) {
        // `out` contains the rendered output.
        html = out;
    });

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
