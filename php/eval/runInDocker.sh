if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t php-eval .
docker run -d  -i -p $IP:5023:5023 -w /home php-eval sh ./run.sh 