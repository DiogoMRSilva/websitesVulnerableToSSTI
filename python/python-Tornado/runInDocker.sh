docker build -t python-tornado .
docker run -d -i -p 5002:5002 -w /home python-tornado sh ./run.sh 