docker build -t java-thymeleaf .
docker run -d  -i -p 5053:5053 -w /home java-thymeleaf sh ./run.sh 
