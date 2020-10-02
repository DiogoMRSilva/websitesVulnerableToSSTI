
# Vulnerable websites
This project has very simple websites to learn how to exploit Server Side Template Injections(SSTI). It might also be used to test automated vulnerability scanning tools.Some of the Servers aren't working

# How to use:
## Run all the servers inside a single docker
To run all the servers in a single docker you need to:
1. Build the docker image by running the script `build.sh`
2. Launch the docker Image by running the script `run.sh`

## Run all the vulnerable servers each on a separated docker image
1. Run the script `startAllDockersIndividually.sh`

## Run a single vulnerable server.
1. Go to the specific template folder ex: `./ruby/ERB/` 
2. Run the script runInDocker.sh

## To stop all the dockers running in the computer
1. Run the script `stopAllRunningDockers.sh` (Be carefull because this will stop your own dockers if you have them)

# Docker image
The docker image is available at https://hub.docker.com/r/d10g0mrs/websites_vuln_to_ssti
or use command
`docker run -d -p 127.0.0.1:5000-5100:5000-5100 -p 127.0.0.1:6000-6100:6000-6100 -w /home d10g0mrs/websites_vuln_to_ssti sh ./start_all_services.sh`



# List of Severs:

| Engine              | Language   | Burp | ZAP | tplmap | site done | known exploit | port | tags                    |
| ---                 | ---        | ---  | --- | ---    | ---  | ---    | ---  | ---                     | 
| jinja2              | Python     | ✓   | ✓    | ✓      | ✓    | ✓      | 5000 | {{%s}}                  |       
| Mako                | Python     | ✓   | ✓    | ✓      | ✓    | ✓      | 5001 | ${%s}                   |        
| Tornado             | Python     | ✓   | ✓    | ✓      | ✓    | ✓      | 5002 | {{%s}}                  |        
| Django              | Python     | ✓   | ✓    | ×      | ✓    | ×      | 5003 | {{ }}                   |        
| (code eval)         | Python     | -   | -    | -      | ✓    | -      | 5004 | na                      |        
| (code exec)         | Python     | -   | -    | -      | ✓    | -      | 5005 | na                      |       
| Smarty              | PHP        | ✓   | ✓    | ✓~    | ✓    | ✓      | 5020 | {%s}                    |       
| Smarty (secure mode)| PHP        | ✓   | ✓    | ✓~    | ✓    | ×      | 5021 | {%s}                    |        
| Twig                | PHP        | ✓   | ✓    | ✓~    | ✓    | ×      | 5022 | {{%s}}                  |       
| (code eval)         | PHP        | -   | -    | -      | ✓    | -      | 5023 | na                      |        
| FreeMarker          | Java       | ✓   | ✓    | ✓     | ✓    | ✓      | 5051 | <#%s > ${%s}            |        
| Velocity            | Java       | ✓   | ✓    | ✓     | ✓    | ✓      | 5052 | #set($x=1+1)${x}        |        
| Thymeleaf           | Java       | ×   | ✓    | x      | ✓    | x      | 5053 | <p th:text="${%s}"></p> |      
| Groovy*             | Java       |     |      |        | ×    | ×      | ×    | ×                       |     
| jade                | Java       |     |      |        | ×    | ×      | ×    | ×                       |     
| jade                | Nodejs     | ✓   | ✓   | ✓      | ✓    | ✓      | 5061 | #{%s}                   |     
| Nunjucks            | JavaScript | ✓   | ✓    | ✓      | ✓    | ✓      | 5062 | {{%s}}                  |      
| doT                 | JavaScript | ×   | ✓    | ✓      | ✓    | ✓      | 5063 | {{=%s}}                 |    
| Marko               | JavaScript |     |      |        | ×    | ×      | ×    | ×                       |    
| Dust                | JavaScript | ×   | ✓    | ✓~      | ✓    | ×      | 5065 | {#%s}or{%s}or{@%s}      |  
| EJS                 | JavaScript | ✓   | ✓    | ✓      | ✓    | ✓      | 5066 | <%= %>                  | 
| (code eval)         | JavaScript | -   | -    | -      | ✓    | -      | 5067 | na                      | 
| vuejs               | JavaScript | ✓   | ✓    | ✓~     | ✓    | ✓      | 5068 | {{%s}}                  | 
| Slim                | Ruby       | ×   | ✓    | x       | ✓    | ✓      | 5080 | #{%s}                   | 
| ERB                 | Ruby       | ✓   | ✓    | ✓      | ✓    | ✓      | 5081 | <%=%s%>                 | 
| (code eval)         | Ruby       | -   | -    | -      | ✓    | -      | 5082 | na                      |
| go                  | go         | x   | ✓    | x      | ✓    |        | 5090 | na                      |


✓ - says it is vulnerable/is done

× - negation of previous

"-" - not applied

~ - not completely 

✓~ -found but says not exploitable

# Special tests for SSTI scanners:
|Test Case | Burp | ZAP | tplmap | port|
| ---      | ---  | --- |  ---   | ---|
|Input rendered in other location |x|✓|x|6001|
|Rendering result not visible to attacker |x|✓|✓|6002|
|Input inserted in the middle of template code math operations|x|x|✓|6003|
|Input inserted in the middle of template code text|yes as code injection|x|✓|6005|
|Non Vulnerable |- |-|-|6004|

All this Severs were made with Mako template engine Due to the exploiting simplicity and the fact that all the scanners detect the vulnerability in the simple case. 

# Generalization tests for SSTI scanners:
|Test Case | Burp | ZAP | tplmap | port|
| ---      | ---  | --- |  ---   | ---|
|{ } Python Eval |✓| |✓|6010|
|${ } Python Eval|✓| |✓|6011|
|{{ }} Python Eval|✓| |✓|6012|
|<%=  %> Python Eval|✓ ERB| |x|6013|
|#{ } Python Eval|x| |x|6014|
|{{= }} Python Eval|x| |x|6015|
| | | | | |
|{ } Ruby Eval |✓ | |x|6020|
|${ } Ruby Eval|✓ | |x|6021|
|{{ }} Ruby Eval|✓ | |YBNE Nunjucks|6022|
|<%=  %> Ruby Eval|✓ | |✓ Erb|6023|
|#{ } Ruby Eval|x | |x|6024|
|{{= }} Ruby Eval|x | |x|6025|

These tests are used to know if the scanner is able to generalize the tags it knows to other templates that have the same tag
what these tests do is to replate the template code zones by the evaluations of its content as a template would do.



# Some exploit development sources:
https://nvisium.com/blog/2016/03/09/exploring-ssti-in-flask-jinja2/

https://nvisium.com/blog/2016/03/11/exploring-ssti-in-flask-jinja2-part-ii/

https://ajinabraham.com/blog/server-side-template-injection-in-tornado

https://github.com/epinna/tplmap

http://blog.portswigger.net/2015/08/server-side-template-injection.html
# Thanks

