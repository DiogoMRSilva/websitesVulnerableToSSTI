if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi


docker build -t generalization22 .
docker run -d -i -p $IP:6022:6022 -w /home generalization22 sh ./run.sh 
