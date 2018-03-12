docker build -t javascript-jade .
docker run -d  -i -p 5061:5061 -w /home javascript-jade sh ./run.sh 
