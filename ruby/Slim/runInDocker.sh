docker build -t ruby-slim .
docker run -d -i -p 5080:5080 -w /home ruby-slim sh ./run.sh 