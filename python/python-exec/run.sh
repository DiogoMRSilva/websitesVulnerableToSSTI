docker build -t python-exec .
docker run -d -i -p 5005:5005 -w /home python-exec sh ./run.sh 
