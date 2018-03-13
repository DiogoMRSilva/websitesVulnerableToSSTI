if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t java-velocity .
docker run -d  -i -p $IP:5052:5052 -w /home java-velocity sh ./run.sh 
