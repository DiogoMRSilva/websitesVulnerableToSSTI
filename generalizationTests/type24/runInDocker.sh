if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi


docker build -t generalization24 .
docker run -d -i -p $IP:6024:6024 -w /home generalization24 sh ./run.sh 
