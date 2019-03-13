require "sinatra"
require 'erb'

set :port,6024
set :bind, '0.0.0.0'
set :show_exceptions, false



def getHTML(name)
    re = /\#{(.*?)}/m
    reWithout = /\#{.*?}/m
    
    name.scan(reWithout) do |match|
        matchesEval = match.to_s.scan(re)[0][0].to_s
        matchesEval = eval(matchesEval).to_s
        name = name.sub(match.to_s, matchesEval)
    end

    
    text = '<!DOCTYPE html><html><body>
    <form action="/" method="post">
      First name:<br>
      <input type="text" name="name" value="">
      <input type="submit" value="Submit">
    </form><h2>Hello '+name+'</h2></body></html>'

    return text

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

# error do
#  "sinatra error handler" 
# end