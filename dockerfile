FROM ubuntu
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y wget 
RUN apt-get install -y git 
RUN apt-get install -y maven 
RUN apt-get install -y openjdk-8-jdk
WORKDIR /home/ubuntu
RUN git clone https://github.com/vsowjanyarani/maven2.git
WORKDIR maven2/web-project/
RUN mvn clean install
ENV keys=aatmaani
RUN wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.78/bin/apache-tomcat-8.5.78.tar.gz
RUN tar -xvzf apache-tomcat-8.5.78.tar.gz
RUN mv apache-tomcat-8.5.78 /opt/tomcat
RUN rm -rf apache-tomcat-8.5.78.tar.gz
#WORKDIR /opt/tomcat/webapps
#RUN cp maven2/web-project/target/web-project.war opt/tomcat/webapps
EXPOSE 8080
#WORKDIR /opt/tomcat/bin
#CMD["/opt/tomcat/bin/catalina.sh","run"]
