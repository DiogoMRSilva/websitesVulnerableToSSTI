if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t python-mako .
docker run -d -i -p $IP:5001:5001 -w /home python-mako sh ./run.sh 