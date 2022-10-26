if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t python-django .
docker run -d -p $IP:5003:5003 python-django
