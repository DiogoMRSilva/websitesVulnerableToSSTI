require "sinatra"
require 'erb'

set :port,5081
set :bind, '0.0.0.0'

def getHTML(name)
    correct_form = <<-slim
      <html>
        head
          title Example
        <body>
          <p><%= name %></p>
        </body>
      </html>
    slim

    text = '<!DOCTYPE html><html><body>
    <form action="/" method="post">
      First name:<br>
      <input type="text" name="name" value="">
      <input type="submit" value="Submit">
    </form><h2>Hello '+name+'</h2></body></html>'

    template = ERB.new(text)

    return template.result(binding)

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