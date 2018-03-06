docker build -t php-servers .
docker run -d  -i -p 5022:5022 -w /home php-servers sh ./run.sh
