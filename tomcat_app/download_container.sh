#!/bin/bash
# this download and unpack tomcat container
# change the tomcat download link for custom version of the container 

wget -O - "http://mirrors.advancedhosters.com/apache/tomcat/tomcat-7/v7.0.55/bin/apache-tomcat-7.0.55.tar.gz" | tar xzf -
mv apache* container_runtime
