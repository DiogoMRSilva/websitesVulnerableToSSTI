if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t generalization5 .
docker run -d -i -p $IP:6015:6015 -w /home generalization5 sh ./run.sh 