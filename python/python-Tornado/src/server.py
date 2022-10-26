

import tornado.ioloop
import tornado.web
import tornado.template


class MainHandler(tornado.web.RequestHandler):
    def get(self):
        self.write('<!DOCTYPE html><html><body>\
    <form action="" method="post">\
      First name:<br>\
      <input type="text" name="name" value="">\
      <input type="submit" value="Submit">\
    </form><h2>Hello  </h2></body></html>')
    def post(self):
        person = ""
        person = self.get_body_argument("name",default="")
        t = tornado.template.Template('<!DOCTYPE html><html><body>\
    <form action="" method="post">\
      First name:<br>\
      <input type="text" name="name" value="">\
      <input type="submit" value="Submit">\
    </form><h2>Hello %s! </h2></body></html>' % person)
        self.write(t.generate())

def make_app():
    return tornado.web.Application([
        (r"/", MainHandler),
    ])

if __name__ == "__main__":
    app = make_app()
    app.listen(5002, address='0.0.0.0')
    tornado.ioloop.IOLoop.current().start()
