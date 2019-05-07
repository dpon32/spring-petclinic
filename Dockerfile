FROM tomcat:alpine
ADD target/petclinic.war /usr/local/tomcat/webapps/petclinic.war
CMD ["catalina.sh", "run"]
