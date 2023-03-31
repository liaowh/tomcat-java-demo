FROM 563494644/test:v1
LABEL maintainer www.ctnrs.com
RUN rm -rf /usr/local/tomcat/webapps/*
ADD . /usr/local/tomcat/webapps
WORKDIR /usr/local/tomcat/webapps
RUN mvn clean package -Dmaven.test.skip=true 
RUN unzip target/*.war -d target/ROOT
ADD target/ROOT /usr/local/tomcat/webapps/ROOT
#ADD target/*.war /usr/local/tomcat/webapps/ROOT.war
