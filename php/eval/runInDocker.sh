docker build -t php-eval .
docker run -d  -i -p 5023:5023 -w /home php-eval sh ./run.sh 