docker build -t javascript-vue .
docker run -d  -i -p 5068:5068 -w /home javascript-vue sh ./run.sh 
