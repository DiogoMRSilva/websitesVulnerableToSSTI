if [ $# -eq 0 ]
  then
    echo "Usage: ./startAllDockers.sh IP
          IP can be 0.0.0.0 or 127.0.0.1"
    exit 1
fi

docker run -d -p $1:5000-5100:5000-5100 -p $1:6000-6100:6000-6100 -w /home all-servers sh ./start_all_services.sh
