if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t ruby-slim .
docker run -d -i -p $IP:5080:5080 -w /home ruby-slim sh ./run.sh 