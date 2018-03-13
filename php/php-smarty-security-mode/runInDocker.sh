if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t php-smarty-secure .
docker run -d  -i -p $IP:5021:5021 -w /home php-smarty-secure sh ./run.sh