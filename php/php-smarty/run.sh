docker build -t php-servers .
docker run -d  -i -p 5020:5020 -w /home php-servers sh ./run.sh 
