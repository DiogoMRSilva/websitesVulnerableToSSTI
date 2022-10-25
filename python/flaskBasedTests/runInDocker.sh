if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t flask-based-tests .
docker run -d -p $IP:6003:6003 flask-based-tests