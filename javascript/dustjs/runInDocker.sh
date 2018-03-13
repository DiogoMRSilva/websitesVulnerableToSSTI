if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t javascript-dustjs .
docker run -d  -i -p $IP:5065:5065 -w /home javascript-dustjs sh ./run.sh 
