
import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;
import java.io.Writer;
import java.util.HashMap;

import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import groovy.*;
import groovy.text.SimpleTemplateEngine;
import groovy.transform.*;


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
    					"<form action='' method='post'>"+
    					"First name:<br>"+
    					"<input type='text' name='name' value=''>"+
    					"<input type='submit' value='Submit'>"+
    					"</form><h2>Hello "+
    					name+
    					"</h2></body></html>";
    	
    	//http://docs.groovy-lang.org/2.4.6/html/api/groovy/text/SimpleTemplateEngine.html
    	//TODO check this later, the following code is in Groovy
    	/*def binding = [
		     firstname : "Grace",
		     lastname  : "Hopper",
		     accepted  : true,
		     title     : 'Groovy for COBOL programmers'
		 ]
		 def engine = new groovy.text.SimpleTemplateEngine()
		 def text = '''\
		 Dear <%= firstname %> $lastname,
		
		 We <% if (accepted) print 'are pleased' else print 'regret' %> \
		 to inform you that your paper entitled
		 '$title' was ${ accepted ? 'accepted' : 'rejected' }.
		
		 The conference committee.
		 '''
		 def template = engine.createTemplate(text).make(binding)
		 println template.toString()*/
    	        		   
    	        		   
    	

    	
    	    	
        return template;
    }

    public static void main(String[] args) throws Exception {
    	System.getProperties().put( "server.port", 5051 );
        SpringApplication.run(SpringBootServer.class, args);
    }
}
