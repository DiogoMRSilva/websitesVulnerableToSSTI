docker build -t php-servers .
docker run -d  -i -p 5023:5023 -w /home php-servers sh ./run.sh 