
import java.io.StringReader;
import java.io.StringWriter;
import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;


import org.apache.velocity.VelocityContext;
import org.apache.velocity.Template;
import org.apache.velocity.app.Velocity;
import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.runtime.RuntimeServices;
import org.apache.velocity.runtime.RuntimeSingleton;
import org.apache.velocity.runtime.parser.ParseException;
import org.apache.velocity.runtime.parser.node.SimpleNode;




@Controller
@EnableAutoConfiguration
public class SpringBootServer {
	
	

    @RequestMapping("/")
    @ResponseBody
    String home(@RequestParam(required=false,name = "name") String name) {
    	System.out.println(name);
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
    	
    	RuntimeServices runtimeServices = RuntimeSingleton.getRuntimeServices();
    	StringReader reader = new StringReader(template);
    	
    	Template t = new Template();
    	t.setRuntimeServices(runtimeServices);
    	try {
    		
			t.setData(runtimeServices.parse(reader, "home"));
			t.initDocument();
			VelocityContext context = new VelocityContext();
		    context.put("name", "World");
		    // now render the template into a StringWriter 
		    StringWriter writer = new StringWriter();
		    t.merge( context, writer );
		    template = writer.toString() ;
		    
		} catch (ParseException e) {
			// TODO Return error or something else different from the template
			e.printStackTrace();
		}
    	
    	
	        
    	
    	//dependent of the template engine
    	//https://freemarker.apache.org/docs/api/freemarker/cache/StringTemplateLoader.html
    	/*try {
			Template t = new Template("home", new StringReader(template), new Configuration());
			Writer out = new StringWriter();
	    	try {
				t.process(new HashMap<Object, Object>(),out);
			} catch (TemplateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	    	template = out.toString();
		} catch (IOException e) {
			
			e.printStackTrace();
		}*/

    	
    	    	
        return template;
    }

    public static void main(String[] args) throws Exception {
    	System.getProperties().put( "server.port", 5052 );
        SpringApplication.run(SpringBootServer.class, args);
    }
}
