if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t javascript-dot .
docker run -d  -i -p $IP:5063:5063 -w /home javascript-dot sh ./run.sh 
