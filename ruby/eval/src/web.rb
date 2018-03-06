require "sinatra"

set :port,5082
set :bind, '0.0.0.0'


def getHTML(expression)

    html = '<!DOCTYPE html><html>
      <body>
        <h1>Online Calculator</h1>
        <form action="/" method="post">
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



get "/" do
  expression =""
  if(params["expression"]!= nil)
    expression =params['expression']
  end
  getHTML(expression)
end

post "/" do
  expression =""
  if(params["expression"]!= nil)
    expression =params['expression']
  end
  getHTML(expression)
end