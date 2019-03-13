if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t output-not-accessible .
docker run -d -i -p $IP:6002:6002 -w /home output-not-accessible sh ./run.sh 