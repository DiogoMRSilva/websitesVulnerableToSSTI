if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t generalization0 .
docker run -d -i -p $IP:6010:5000 -w /home generalization0 sh ./run.sh 