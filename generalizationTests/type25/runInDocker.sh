if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi


docker build -t generalization25 .
docker run -d -i -p $IP:6025:6025 -w /home generalization25 sh ./run.sh 
