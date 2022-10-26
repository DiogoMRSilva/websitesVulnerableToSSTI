if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t php-template-injections .
docker run --rm -d  -i -p $IP:5023:80 php-template-injections 