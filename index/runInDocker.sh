if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t index .
docker run --rm -d -p $IP:4000:80 index