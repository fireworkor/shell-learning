#!/bin/bash
echo "JAVA_HOME=/usr/local/jdk" >> /etc/profile
echo "PATH=$PATH:$JAVA_HOME/bin" >> /etc/profile
echo "export JAVA_HOME" >> /etc/profile
chmod 444 addEnv.sh