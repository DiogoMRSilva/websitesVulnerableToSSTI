docker build -t php-smarty-secure .
docker run -d  -i -p 5021:5021 -w /home php-smarty-secure sh ./run.sh