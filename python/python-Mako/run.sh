docker build -t python-mako .
docker run -d -i -p 5001:5001 -w /home python-mako sh ./run.sh 