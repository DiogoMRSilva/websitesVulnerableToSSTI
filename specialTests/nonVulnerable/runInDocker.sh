if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t non-vulnerable .
docker run -d -i -p $IP:6004:5001 -w /home non-vulnerable sh ./run.sh 