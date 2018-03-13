if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t python-eval .
docker run -d -i -p $IP:5004:5004 -w /home python-eval sh ./run.sh 