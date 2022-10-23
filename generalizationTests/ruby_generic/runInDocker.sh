if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t generalizationruby .
docker run -d -p $IP:6020:6020 generalizationruby