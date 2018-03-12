docker build -t ruby-eval .
docker run -d -i -p 5082:5082 -w /home ruby-eval sh ./run.sh 