FROM  maven:3.6.0-jdk-11-slim 
COPY src/ /home
WORKDIR /home
RUN mvn clean package
CMD ["java", "-jar", "target/server.jar"]

