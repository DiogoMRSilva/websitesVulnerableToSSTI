docker build -t ruby-erb .
docker run -d -i -p 5081:5081 -w /home ruby-erb sh ./run.sh 