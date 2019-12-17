# Pull tomcat latest image from dockerhub 
From tomcat:9.0

# Maintainer
MAINTAINER "Sivaram Sajeev" 

# copy war file on to container 
COPY ./target/Jg-web.war /usr/local/tomcat/webapps