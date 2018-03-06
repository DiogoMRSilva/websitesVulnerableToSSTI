docker build -t javascript-dustjs .
docker run -d  -i -p 5065:5065 -w /home javascript-dustjs sh ./run.sh 
