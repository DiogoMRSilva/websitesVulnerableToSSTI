if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t input-inserted-middle-code .
docker run -d -i -p $IP:6003:6003 -w /home input-inserted-middle-code sh ./run.sh 