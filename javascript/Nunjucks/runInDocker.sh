if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t javascript-nunjucks .
docker run -d  -i -p $IP:5062:5062 -w /home javascript-nunjucks sh ./run.sh 
