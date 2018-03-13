if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t php-smarty .
docker run -d  -i -p $IP:5020:5020 -w /home php-smarty sh ./run.sh 
