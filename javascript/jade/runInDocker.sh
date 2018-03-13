if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t javascript-jade .
docker run -d  -i -p $IP:5061:5061 -w /home javascript-jade sh ./run.sh 
