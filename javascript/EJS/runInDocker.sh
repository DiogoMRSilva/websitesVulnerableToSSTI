docker build -t javascript-ejs .
docker run -d  -i -p 5066:5066 -w /home javascript-ejs sh ./run.sh 
