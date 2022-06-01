if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi


docker build -t generalization20 .
docker run -d -i -p $IP:6020:6020 -w /home generalization20 sh ./run.sh 
