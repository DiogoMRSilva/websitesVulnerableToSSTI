docker build -t php-twig .
docker run -d  -i -p 5022:5022 -w /home php-twig sh ./run.sh
