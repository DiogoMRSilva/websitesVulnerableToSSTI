if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t php-twig .
docker run -d  -i -p $IP:5022:5022 -w /home php-twig sh ./run.sh
