//Same for all javascritp template tengines
const express = require('express')
var bodyParser = require('body-parser');
const app = express()
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
const port = 5063

require('./eval')(app, "/eval");
require('./dot')(app, "/dot");
require('./jade')(app, "/jade");
require('./dust')(app, "/dust");
require('./ejs')(app, "/ejs");
//require('./marko')(app, "/marko");
require('./nunjucks')(app, "/nunjucks");
require('./vue')(app, "/vue");

app.get('/', (request, response) => {
    var html = `
    <!DOCTYPE html>
    <html>
        <body>
            <a href="eval">eval/</a><br>
            <a href="dot">dot</a><br>
            <a href="jade">jade</a><br>
            <a href="dust">dust</a><br>
            <a href="ejs">ejs</a><br>
            <a href="nunjucks">nunjucks</a><br>
            <a href="vue">vue</a><br>
        </body>
    </html>
    `
    response.send(html)
})

app.listen(port, (err) => {
if (err) {
    
    return console.log('something bad happened', err)
}

console.log(`server is listening on ${port}`)
})

