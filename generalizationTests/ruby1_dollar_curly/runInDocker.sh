if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi


docker build -t generalization21 .
docker run -d -i -p $IP:6021:6021 -w /home generalization21 sh ./run.sh 
