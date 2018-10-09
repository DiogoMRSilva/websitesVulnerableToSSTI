if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi


docker build -t generalization23 .
docker run -d -i -p $IP:6023:5081 -w /home generalization23 sh ./run.sh 
