FROM iamdevopstrainer/addressbook:6
COPY /var/lib/jenkins/workspace/$PROJECT_NAME/target/addressbook.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
