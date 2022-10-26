if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t javascript-apps .
docker run -d -p $IP:5063:5063 javascript-apps
