if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t javascript-vue .
docker run -d  -i -p $IP:5068:5068 -w /home javascript-vue sh ./run.sh 
