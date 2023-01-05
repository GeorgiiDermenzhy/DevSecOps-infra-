#!/bin/bash
#
sudo yum -y remove java
sudo yum install wget -y
sudo yum -y upgrade
echo "========================================"
echo "=======---Installing JAVA v.11---======="
echo "========================================"
sudo yum install -y java-11-openjdk
echo "========================================"
echo "========---Installing JENKINS---========"
echo "========================================"
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum install -y jenkins
sudo yum upgrade -y
sudo systemctl daemon-reload
sudo systemctl enable jenkins
sudo systemctl start jenkins
echo "========================================"
echo "==========---Installing GIT---=========="
echo "========================================"
sudo yum -y remove git
sudo yum -y remove git-*
sudo yum -y install https://packages.endpointdev.com/rhel/7/os/x86_64/endpoint-repo.x86_64.rpm
sudo yum install -y git
git --version