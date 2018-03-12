#find ./ -name runInDocker.sh -type f -exec /bin/sh '{}' \;
for f in ./**/*/runInDocker.sh
do
  echo $f
  echo $(dirname $f)
  cd $(dirname $f)
  ./runInDocker.sh
  cd -  
done
#find -name '*runInDocker.sh' -printf '%h\n' | sort -u
#-name asdf1234