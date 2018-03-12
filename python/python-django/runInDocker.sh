docker build -t python-django .
docker run -d  -i -p 5003:5003 -w /home python-django sh ./run.sh 
