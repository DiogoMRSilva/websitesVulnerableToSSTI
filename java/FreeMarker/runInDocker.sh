if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t java-freemarker .
docker run -d  -i -p $IP:5051:5051 -w /home java-freemarker sh ./run.sh 
