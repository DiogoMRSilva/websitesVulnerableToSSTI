if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi

docker build -t java-thymeleaf .
docker run -d -p $IP:5053:5053 java-thymeleaf
