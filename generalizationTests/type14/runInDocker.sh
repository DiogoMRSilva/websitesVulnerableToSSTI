if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t generalization4 .
docker run -d -i -p $IP:6014:5000 -w /home generalization4 sh ./run.sh 