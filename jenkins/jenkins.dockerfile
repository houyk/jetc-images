
# docker ready for jenkins(DOOD)

FROM jetc/centos


USER root

WORKDIR /

ENV JENKINS_HOME=/var/jenkins


# Service mode is not good for container
# RUN yum install -y jenkins

RUN curl -Lo jenkins.war http://mirrors.jenkins.io/war-stable/latest/jenkins.war

# install plugins
#COPY plugins.txt /usr/share/jenkins/ref/
#COPY custom.groovy /usr/share/jenkins/ref/init.groovy.d/custom.groovy
#RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt


 
#java -jar jenkins.war --help
#--logfile
# /var/log/jenkins/jenkins.log
# JENKINS_HOME/plugins

CMD [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /jenkins.war --httpPort=8080 --logfile=/var/jenkins/jenkins.log" ]

# USAGE
# docker run -d --restart=always \
#                -e JAVA_OPTS=-Dhudson.footerURL=http://yourhost \
#                -v /var/run/docker.sock:/var/run/docker.sock \
#                -v /var/jenkins:/var/jenkins \
#                -v /root/.m2:/root/.m2 \
#                -v /dev/urandom:/dev/random \
#                --name jenkins \
#                -p 8080:8080 \
#                -p 50000:50000 \
#                jetc/jenkins
