for f in /home/*/*/*/requirements.sh
do
  echo $f
  echo $(dirname $f)
  cd $(dirname $f)
  chmod +x requirements.sh 
  ./requirements.sh
  cd -  
done