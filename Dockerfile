FROM tomcat:8.5.50
WORKDIR /usr/local/tomcat/webapps/
COPY */ABCtechnologies-1.0.war /usr/local/tomcat/webapps/
EXPOSE 8090
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
