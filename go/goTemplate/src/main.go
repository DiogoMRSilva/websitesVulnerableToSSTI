package main

import (
  "html/template"
  "net/http"
)



func handler(w http.ResponseWriter, r *http.Request) {
  //var name = ""
  r.ParseForm()                     // Parses the request body
  x := r.Form.Get("name")
  

  var tmpl = `<!DOCTYPE html><html><body>
<form action="" method="post">
    First name:<br>
<input type="text" name="name" value="">
<input type="submit" value="Submit">
</form><p>` + x + ` </p></body></html>`

  t := template.New("main") //name of the template is main
  t, _ = t.Parse(tmpl) // parsing of template string
  t.Execute(w, "Hello")
}

func main() {
  server := http.Server{
    Addr: "0.0.0.0:5090",
  }
  http.HandleFunc("/", handler)
  server.ListenAndServe()
}