docker build -t java-freemarker .
docker run -d  -i -p 5051:5051 -w /home java-freemarker sh ./run.sh 
