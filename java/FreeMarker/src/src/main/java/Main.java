
import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;
import java.io.Writer;
import java.util.HashMap;

import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

@Controller
@EnableAutoConfiguration
public class Main {

	@RequestMapping("/")
	@ResponseBody
	String home(@RequestParam(required = false, name = "name") String name) {

		if (name == null) {
			name = "";
		}

		String template = "<!DOCTYPE html><html><body>" +
				"<form action='' method='post'>" +
				"First name:<br>" +
				"<input type='text' name='name' value=''>" +
				"<input type='submit' value='Submit'>" +
				"</form><h2>Hello " +
				name +
				"</h2></body></html>";

		// dependent of the template engine
		// https://freemarker.apache.org/docs/api/freemarker/cache/StringTemplateLoader.html
		try {
			Template t = new Template("home", new StringReader(template), new Configuration());
			Writer out = new StringWriter();
			try {
				t.process(new HashMap<Object, Object>(), out);
			} catch (TemplateException e) {
				// TODO Return error or something else different from the template
				e.printStackTrace();
			}

			template = out.toString();
		} catch (IOException e) {

			e.printStackTrace();
		}

		return template;
	}

	public static void main(String[] args) throws Exception {
		System.getProperties().put("server.port", 5051);
		SpringApplication.run(Main.class, args);
	}
}
