if [ $# -eq 0 ]
  then
    IP="127.0.0.1" 
else
    IP=$1
fi
cp ../README.md .
docker build -t index-all .
docker run -d -i -p $IP:4000:4000 -w /home index-all python makeRootWithAllLinks.py 
rm README.md