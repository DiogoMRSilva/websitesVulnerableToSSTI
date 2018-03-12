for f in ./**/*/runInDocker.sh
do
  echo $f
  echo $(dirname $f)
  cd $(dirname $f)
  ./runInDocker.sh
  cd -  
done