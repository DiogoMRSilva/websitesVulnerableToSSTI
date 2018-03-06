docker build -t python-jinja2 .
docker run -d  -i -p 5000:5000 -w /home python-jinja2 sh ./run.sh 