if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t ruby-erb .
docker run -d -i -p $IP:5081:5081 -w /home ruby-erb sh ./run.sh 