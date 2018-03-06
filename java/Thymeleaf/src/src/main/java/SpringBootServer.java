
import java.io.StringWriter;
import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;
import org.thymeleaf.templatemode.TemplateMode;
import org.thymeleaf.templateresolver.StringTemplateResolver;

@Controller
@EnableAutoConfiguration
public class SpringBootServer {
	
	

    @RequestMapping("/")
    @ResponseBody
    String home(@RequestParam(required=false,name = "name") String name) {
    	
    	if (name == null) {
    		name = "";
    	}
    	
    	String template ="<!DOCTYPE html><html><body>"+
    					"<form action='/' method='post'>"+
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

    public static void main(String[] args) throws Exception {
    	System.getProperties().put( "server.port", 5053 );
    	
        SpringApplication.run(SpringBootServer.class, args);
    }
}
