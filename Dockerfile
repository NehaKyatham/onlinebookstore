FROM tomcat:9.0-jdk17-temurin

# Remove default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file into Tomcat as ROOT.war
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]

