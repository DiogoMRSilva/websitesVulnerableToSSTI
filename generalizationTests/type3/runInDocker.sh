if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t generalization1 .
docker run -d -i -p $IP:6013:5000 -w /home generalization1 sh ./run.sh 