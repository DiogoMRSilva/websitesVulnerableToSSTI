if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t goTemplate .
docker run -d  -i -p $IP:5090:8080 -w /home goTemplate sh ./run.sh 