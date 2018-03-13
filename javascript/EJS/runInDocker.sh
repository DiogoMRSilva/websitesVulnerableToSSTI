if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t javascript-ejs .
docker run -d  -i -p $IP:5066:5066 -w /home javascript-ejs sh ./run.sh 
