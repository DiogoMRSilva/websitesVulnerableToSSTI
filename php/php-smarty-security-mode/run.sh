docker build -t php-servers .
docker run -d  -i -p 5021:5021 -w /home php-servers sh ./run.sh