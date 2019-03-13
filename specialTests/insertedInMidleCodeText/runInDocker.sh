if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t input-inserted-middle-code-text .
docker run -d -i -p $IP:6005:6005 -w /home input-inserted-middle-code-text sh ./run.sh 