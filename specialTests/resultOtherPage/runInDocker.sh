if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t output-other-page .
docker run -d -i -p $IP:6001:5001 -w /home output-other-page sh ./run.sh 