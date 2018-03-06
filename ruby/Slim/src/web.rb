require "sinatra"
require "slim"

set :port,5080
set :bind, '0.0.0.0'


def getHTML(name)
    correct_form = <<-slim
      <html>
        head
          title Example
        <body>
          <p>#{name}</p>
        </body>
      </html>
    slim

    template = '<!DOCTYPE html><html><body>
    <form action="/" method="post">
      First name:<br>
      <input type="text" name="name" value="">
      <input type="submit" value="Submit">
    </form><h2>Hello '+name+'</h2></body></html>'
    return Slim::Template.new{ template }.render
end



get "/" do
  name =""
  if(params["name"]!= nil)
    name =params['name']
  end
  getHTML(name)
end

post "/" do
  name =""
  if(params["name"]!= nil)
    name =params['name']
  end
  getHTML(name)
end