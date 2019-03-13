FROM ubuntu:18.04

COPY go/ /home/go
COPY java/ /home/java
COPY javascript/ /home/javascript
COPY php/ /home/php
COPY python/ /home/python
COPY ruby/ /home/ruby
COPY specialTests/ /home/specialTests
COPY generalizationTests/ /home/generalizationTests

COPY start_all_services.sh /home/start_all_services.sh
COPY get_all_requirements.sh /home/get_all_requirements.sh


run apt update

#go servers
EXPOSE 5090
RUN apt install -y golang-go

#python servers
EXPOSE 5000
EXPOSE 5001
EXPOSE 5002
EXPOSE 5003
EXPOSE 5004
EXPOSE 5005
#RUN apt-get install -y python
#RUN apt install -y python-pip
RUN apt install -y python3
RUN apt install -y python3-pip

#php servers
EXPOSE 5020
EXPOSE 5021
EXPOSE 5022
EXPOSE 5023
RUN DEBIAN_FRONTEND=noninteractive apt install -q -y php7.2-dev

#java servers
EXPOSE 5051 
EXPOSE 5052
EXPOSE 5053
RUN apt install -y openjdk-8-jdk

#Nodejs servers
EXPOSE 5061
EXPOSE 5062
EXPOSE 5063
EXPOSE 5064
EXPOSE 5065
EXPOSE 5066
EXPOSE 5067
EXPOSE 5068
RUN apt install -y nodejs
RUN apt install -y npm

#Ruby servers
EXPOSE 5080
EXPOSE 5081
EXPOSE 5082
RUN apt install -y ruby

#Special Tests
EXPOSE 6001
EXPOSE 6002
EXPOSE 6003
EXPOSE 6004
EXPOSE 6005

# Generalization tests
EXPOSE 6010
EXPOSE 6011
EXPOSE 6012
EXPOSE 6013
EXPOSE 6014
EXPOSE 6015
EXPOSE 5020
EXPOSE 5021
EXPOSE 5022
EXPOSE 5023
EXPOSE 5024
EXPOSE 5025

RUN /home/get_all_requirements.sh