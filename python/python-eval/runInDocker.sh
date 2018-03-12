docker build -t python-eval .
docker run -d -i -p 5004:5004 -w /home python-eval sh ./run.sh 