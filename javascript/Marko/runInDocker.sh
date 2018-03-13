if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t javascript-marko .
docker run -d  -i -p $IP:5064:5064 -w /home javascript-marko sh ./run.sh 
