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
echo "========================================"
echo "==========---Installing NPM---=========="
echo "========================================"
curl -sL https://rpm.nodesource.com/setup_14.x | sudo bash -
sudo yum -y install nodejs
echo "========================================"
echo "=========---Installing Docker---========"
echo "========================================"
sudo yum -y remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine
sudo yum install -y yum-utils
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo groupadd docker
sudo usermod -aG docker jenkins
sudo usermod -aG docker vagrant
sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl restart docker
sudo systemctl restart jenkins

echo "========================================"
echo "=========---Installing Trivy---========"
echo "========================================"
sudo rpm -ivh https://github.com/aquasecurity/trivy/releases/download/v0.37.3/trivy_0.37.3_Linux-64bit.rpm