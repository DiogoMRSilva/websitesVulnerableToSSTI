var jade = require('jade');


function getHTML(input){
    var template =`
doctype
html
head
    title= 'Hello world'
body
    form(action='' method='post')
        label(for='name') Name:
            input#name.form-control(type='text', placeholder='' name='name')
        button.btn.btn-primary(type='submit') Submit
    p Hello `+input

    var fn = jade.compile(template);
    var html = fn({name:'Oleg'});
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

