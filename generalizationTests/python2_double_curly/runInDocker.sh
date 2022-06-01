if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t generalization2 .
docker run -d -i -p $IP:6012:6012 -w /home generalization2 sh ./run.sh 