FROM 563494644/tomcat-maven:v1
LABEL maintainer www.ctnrs.com
RUN rm -rf /usr/local/tomcat/webapps/*
COPY . /usr/local/tomcat/webapps
WORKDIR /usr/local/tomcat/webapps
RUN mvn clean package -Dmaven.test.skip=true -X \
   && unzip target/*.war -d target/ROOT \
   && mv /usr/local/tomcat/webapps/target/ROOT  /usr/local/tomcat/webapps/ROOT
