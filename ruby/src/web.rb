require "sinatra"
require 'erb'
require "slim"

set :port, 6020
set :bind, '0.0.0.0'
set :show_exceptions, false



def getHTML(name, re, reWithout)
    name.scan(reWithout) do |match|
        matchesEval = match.to_s.scan(re)[0][0].to_s
        matchesEval = eval(matchesEval).to_s
        name = name.sub(match.to_s, matchesEval)
    end

    text = '<!DOCTYPE html><html><body>
    <form action="" method="post">
      First name:<br>
      <input type="text" name="name" value="">
      <input type="submit" value="Submit">
    </form><h2>Hello '+name+'</h2></body></html>'

    return text

end


get "/curly" do
  name =""
  if(params["name"]!= nil)
    name =params['name']
  end
  re = /{(.*?)}/m
  reWithout = /{.*?}/m
  getHTML(name, re, reWithout)

end

post "/curly" do
  name =""
  if(params["name"]!= nil)
    name =params['name']
  end
  re = /{(.*?)}/m
  reWithout = /{.*?}/m
  getHTML(name, re, reWithout)
end


get "/dollar_curly" do
  name =""
  if(params["name"]!= nil)
    name =params['name']
  end
  re = /\${(.*?)}/m
  reWithout = /\${.*?}/m
  getHTML(name, re, reWithout)
end

post "/dollar_curly" do
  name =""
  if(params["name"]!= nil)
    name =params['name']
  end
  re = /\${(.*?)}/m
  reWithout = /\${.*?}/m
  getHTML(name, re, reWithout)
end

get "/double_curly" do
  name =""
  if(params["name"]!= nil)
    name =params['name']
  end
  re = /{{(.*?)}}/m
  reWithout = /{{.*?}}/m
  getHTML(name, re, reWithout)
end

post "/double_curly" do
  name =""
  if(params["name"]!= nil)
    name =params['name']
  end
  re = /{{(.*?)}}/m
  reWithout = /{{.*?}}/m
  getHTML(name, re, reWithout)
end

get "/less_percentage_equal" do
  name =""
  if(params["name"]!= nil)
    name =params['name']
  end
  re = /<%=(.*?)%>/m
  reWithout = /<%=.*?%>/m
  getHTML(name, re, reWithout)
end

post "/less_percentage_equal" do
  name =""
  if(params["name"]!= nil)
    name =params['name']
  end
  re = /<%=(.*?)%>/m
  reWithout = /<%=.*?%>/m
  getHTML(name, re, reWithout)
end

get "/hash_curly" do
  name =""
  if(params["name"]!= nil)
    name =params['name']
  end
  re = /\#{(.*?)}/m
  reWithout = /\#{.*?}/m
  getHTML(name, re, reWithout)
end

post "/hash_curly" do
  name =""
  if(params["name"]!= nil)
    name =params['name']
  end
  re = /\#{(.*?)}/m
  reWithout = /\#{.*?}/m
  getHTML(name, re, reWithout)
end

get "/double_curly_equal" do
  name =""
  if(params["name"]!= nil)
    name =params['name']
  end
  re = /{{=(.*?)}}/m
  reWithout = /{{=.*?}}/m
  getHTML(name, re, reWithout)
end

post "/double_curly_equal" do
  name =""
  if(params["name"]!= nil)
    name =params['name']
  end
  re = /{{=(.*?)}}/m
  reWithout = /{{=.*?}}/m
  getHTML(name, re, reWithout)
end

def getEvalHTML(expression)

  html = '<!DOCTYPE html><html>
    <body>
      <h1>Online Calculator</h1>
      <form action="" method="post">
          expression:<br>
          <input type="text" name="expression" value="">
          <input type="submit" value="Submit">
      </form>
      <h2>'
      
  if(expression != nil && expression != "" )
    html += expression.to_s + ' = ' + eval(expression).to_s
  end
  html +='
      </h2>
    </body>
  </html>'

  return html
end

get "/eval" do
  expression =""
  if(params["expression"]!= nil)
    expression =params['expression']
  end
  getEvalHTML(expression)
end

post "/eval" do
  expression =""
  if(params["expression"]!= nil)
    expression =params['expression']
  end
  getEvalHTML(expression)
end

def getHTMLERBRendered(name)
  text = '<!DOCTYPE html><html><body>
  <form action="" method="post">
    First name:<br>
    <input type="text" name="name" value="">
    <input type="submit" value="Submit">
  </form><h2>Hello '+name+'</h2></body></html>'
  template = ERB.new(text)
  return template.result(binding)

end

get "/erb" do
  name =""
  if(params["name"]!= nil)
    name =params['name']
  end
  getHTMLERBRendered(name)
end

post "/erb" do
  name =""
  if(params["name"]!= nil)
    name =params['name']
  end
  getHTMLERBRendered(name)
end

def getHTMLSlimRendered(name)
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
  <form action="" method="post">
    First name:<br>
    <input type="text" name="name" value="">
    <input type="submit" value="Submit">
  </form><h2>Hello '+name+'</h2></body></html>'
  return Slim::Template.new{ template }.render
end

get "/slim" do
  name =""
  if(params["name"]!= nil)
    name =params['name']
  end
  getHTMLSlimRendered(name)
end

post "/slim" do
  name =""
  if(params["name"]!= nil)
    name =params['name']
  end
  getHTMLSlimRendered(name)
end

indexText = '
<!DOCTYPE html><html><body>
<a href="curly">curly</a><br>
<a href="dollar_curly">dollar_curly</a><br>
<a href="double_curly">double_curly</a><br>
<a href="less_percentage_equal">less_percentage_equal</a><br>
<a href="hash_curly">hash_curly</a><br>
<a href="double_curly_equal">double_curly_equal</a><br>
<a href="eval">eval</a><br>
<a href="erb">erb template engine</a><br>
<a href="slim">slim template engine</a><br>
</body></html>'

get "/" do
  indexText
end

post "/" do
  indexText
end

# error do
#  "sinatra error handler" 
# end