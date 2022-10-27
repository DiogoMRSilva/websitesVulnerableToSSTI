if [ $# -eq 0 ]
  then
    echo "Usage: ./startAllDockers.sh IP
          IP can be 0.0.0.0 or 127.0.0.1"
    exit 1
fi

IP=$1 docker-compose up --build