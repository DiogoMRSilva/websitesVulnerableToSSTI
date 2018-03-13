if [ $# -eq 0 ]
  then
    echo "Usage: ./startAllDockers.sh IP
          IP can be 0.0.0.0 or 127.0.0.1"
    exit 1
fi

for f in ./**/*/runInDocker.sh
do
  echo $f
  echo $(dirname $f)
  cd $(dirname $f)
  ./runInDocker.sh $1
  cd -  
done