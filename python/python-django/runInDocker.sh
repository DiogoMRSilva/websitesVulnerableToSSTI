if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t python-django .
docker run -d  -i -p $IP:5003:5003 -w /home python-django sh ./run.sh 
