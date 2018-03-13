if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t python-jinja2 .
docker run -d  -i -p $IP:5000:5000 -w /home python-jinja2 sh ./run.sh 