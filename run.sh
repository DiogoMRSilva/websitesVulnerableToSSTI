docker build -t all-servers .
docker run -d  -i -p 3000:3000 -w /home all-servers sh ./run.sh 
