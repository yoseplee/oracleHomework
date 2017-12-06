FROM tomcat:latest
RUN mkdir -p /usr/local/tomcat/webapps/test/WEB-INF/lib
COPY ./mysql-connector-java-5.1.44-bin.jar /usr/local/tomcat/webapps/test/WEB-INF/lib 
COPY ./web.xml /usr/local/tomcat/webapps/test/WEB-INF
COPY ./db.jsp /usr/local/tomcat/webapps/test
EXPOSE 8080
CMD ["catalina.sh", "run"]
