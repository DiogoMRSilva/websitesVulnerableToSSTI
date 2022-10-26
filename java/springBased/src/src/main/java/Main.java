
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

import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;
import org.thymeleaf.templatemode.TemplateMode;
import org.thymeleaf.templateresolver.StringTemplateResolver;

import org.apache.velocity.VelocityContext;
import org.apache.velocity.runtime.RuntimeServices;
import org.apache.velocity.runtime.RuntimeSingleton;
import org.apache.velocity.runtime.parser.ParseException;

@Controller
@EnableAutoConfiguration
public class Main {

	@RequestMapping("/")
	@ResponseBody
	String home(@RequestParam(required = false, name = "name") String name) {

		return "<!DOCTYPE html><html><body>"+
				"<a href=\"freemarker\">freemarker</a><br>" +
				"<a href=\"thymeleaf\">thymeleaf</a><br>" +
				"<a href=\"velocity\">velocity</a><br>" +
				"</body></html>";
	}

	@RequestMapping("/freemarker")
	@ResponseBody
	String freemarker(@RequestParam(required = false, name = "name") String name) {

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

	@RequestMapping("/thymeleaf")
    @ResponseBody
    String thymeleaf(@RequestParam(required=false, name = "name") String name) {
    	
    	if (name == null) {
    		name = "";
    	}
    	
    	String template ="<!DOCTYPE html><html><body>"+
    					"<form action='' method='post'>"+
    					"First name:<br>"+
    					"<input type='text' name='name' value=''>"+
    					"<input type='submit' value='Submit'>"+
    					"</form><h2>Hello "+
    					name+
    					"</h2></body></html>";
    	

    	StringTemplateResolver resolver = new StringTemplateResolver();
    	resolver.setTemplateMode(TemplateMode.HTML);
    	TemplateEngine engine = new TemplateEngine();
    	engine.setTemplateResolver(resolver);
    	
    	StringWriter out = new StringWriter();
    	Context context = new Context();
    	engine.process(template, context, out);
    	template = out.toString();
        return template;
    }

	@RequestMapping("/velocity")
	@ResponseBody
	String velocity(@RequestParam(required = false, name = "name") String name) {
		System.out.println(name);
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

		RuntimeServices runtimeServices = RuntimeSingleton.getRuntimeServices();
		StringReader reader = new StringReader(template);

		org.apache.velocity.Template t = new org.apache.velocity.Template();
		t.setRuntimeServices(runtimeServices);
		try {

			t.setData(runtimeServices.parse(reader, "home"));
			t.initDocument();
			VelocityContext context = new VelocityContext();
			context.put("name", "World");
			// now render the template into a StringWriter
			StringWriter writer = new StringWriter();
			t.merge(context, writer);
			template = writer.toString();

		} catch (ParseException e) {
			// TODO Return error or something else different from the template
			e.printStackTrace();
		}

		return template;
	}

	public static void main(String[] args) throws Exception {
		System.getProperties().put("server.port", 5051);
		SpringApplication.run(Main.class, args);
	}
}
