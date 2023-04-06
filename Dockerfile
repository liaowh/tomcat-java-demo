FROM 563494644/tomcat-maven:v1
LABEL maintainer www.ctnrs.com
RUN rm -rf /usr/local/tomcat/webapps/*
COPY . /usr/local/tomcat/webapps
RUN ls -l /usr/local/tomcat/webapps
WORKDIR /usr/local/tomcat/webapps
RUN mvn clean package -Dmaven.test.skip=true -X
RUN unzip target/*.war -d target/ROOT
RUN ls -l /usr/local/tomcat/webapps
RUN ls -l /usr/local/tomcat/webapps/target
RUN ls -l /usr/local/tomcat/webapps/target/ROOT
RUN pwd
RUN ls -l /usr/local/tomcat/webapps/tomcat-java-demo/target/ROOT
WORKDIR /usr/local/tomcat/webapps/target
COPY ./ROOT /usr/local/tomcat/webapps/ROOT
#ADD target/*.war /usr/local/tomcat/webapps/ROOT.war
