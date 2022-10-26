var nunjucks = require('nunjucks');

function getHTML(input){
    var template =`<!DOCTYPE html><html><body>
    <form action="" method="post">
        First name:<br>
    <input type="text" name="name" value="">
    <input type="submit" value="Submit">
    </form><p>Hello `+input+`</p></body></html>`

    nunjucks.configure({ autoescape: true });
    html = nunjucks.renderString(template, { username: 'James' });
    console.log(input)
    console.log(html);
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

