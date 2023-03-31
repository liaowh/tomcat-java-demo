FROM tomcat:8-jdk17
LABEL maintainer www.ctnrs.com
RUN rm -rf /usr/local/tomcat/webapps/*
ADD . /usr/local/tomcat/webapps
WORKDIR /usr/local/tomcat/webapps
RUN apt-get updata && apt-get install -y maven
RUN mvn clean package -Dmaven.test.skip=true 
RUN unzip target/*.war -d target/ROOT
ADD target/ROOT /usr/local/tomcat/webapps/ROOT
