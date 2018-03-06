docker build -t javascript-nunjucks .
docker run -d  -i -p 5062:5062 -w /home javascript-nunjucks sh ./run.sh 
