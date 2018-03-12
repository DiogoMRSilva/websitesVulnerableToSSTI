docker build -t java-velocity .
docker run -d  -i -p 5052:5052 -w /home java-velocity sh ./run.sh 
