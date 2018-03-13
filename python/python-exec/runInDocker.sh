if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t python-exec .
docker run -d -i -p $IP:5005:5005 -w /home python-exec sh ./run.sh 
