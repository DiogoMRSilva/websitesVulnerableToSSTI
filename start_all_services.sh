for f in /home/*/*/*/run.sh
do
  echo $f
  echo $(dirname $f)
  cd $(dirname $f)
  chmod +x run.sh 
  ./run.sh &
  cd -  
done

while :
do
	sleep 999
done