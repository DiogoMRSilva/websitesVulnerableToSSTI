if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t generalization3 .
docker run -d -i -p $IP:6013:6013 -w /home generalization3 sh ./run.sh 