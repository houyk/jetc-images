
# centos7 with JDK and Docker ready(satisfy as DOOD base image)

FROM centos:7

ENV TZ="Asia/Shanghai"
ENV LC_ALL="en_US.UTF-8"

RUN yum install -y which net-tools yum-utils 
RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

RUN yum install -y java-1.8.0-openjdk-devel docker-ce

# RUN systemctl disable docker


