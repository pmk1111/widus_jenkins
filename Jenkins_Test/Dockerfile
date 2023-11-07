FROM openjdk:17-ea-11-jdk-slim
COPY ./target/myhome-0.0.1-SNAPSHOT.war /security.war
RUN mkdir -p /home/ubuntu/download
copy ./logo.png  /usr/src/logo.png 
ENTRYPOINT ["java", "-jar", "security.war"]