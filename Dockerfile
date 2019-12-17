# Pull tomcat latest image from dockerhub 
From tomcat:9.0

# Maintainer
MAINTAINER "Sivaram Sajeev" 

# copy war file on to container 
COPY ./target/Jg_maven_webapp.war /usr/local/tomcat/webapps