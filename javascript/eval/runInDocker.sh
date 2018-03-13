if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t javascript-eval .
docker run -d  -i -p $IP:5067:5067 -w /home javascript-eval sh ./run.sh 
