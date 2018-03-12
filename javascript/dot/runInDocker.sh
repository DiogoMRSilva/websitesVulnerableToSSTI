docker build -t javascript-dot .
docker run -d  -i -p 5063:5063 -w /home javascript-dot sh ./run.sh 
