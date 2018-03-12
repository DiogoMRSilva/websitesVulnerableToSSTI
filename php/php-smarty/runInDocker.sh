docker build -t php-smarty .
docker run -d  -i -p 5020:5020 -w /home php-smarty sh ./run.sh 
