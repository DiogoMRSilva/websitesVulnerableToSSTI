docker build -t javascript-eval .
docker run -d  -i -p 5067:5067 -w /home javascript-eval sh ./run.sh 
