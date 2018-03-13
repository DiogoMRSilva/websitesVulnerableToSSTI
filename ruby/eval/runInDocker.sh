if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t ruby-eval .
docker run -d -i -p $IP:5082:5082 -w /home ruby-eval sh ./run.sh 