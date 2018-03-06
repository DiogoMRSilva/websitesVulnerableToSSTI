docker build -t javascript-marko .
docker run -d  -i -p 5064:5064 -w /home javascript-marko sh ./run.sh 
