#!/bin/bash

sudo apt update && apt upgrade
sudo apt install openjdk-8-jdk
sudo apt install python3

cd /opt/spark
sudo wget https://downloads.apache.org/spark/spark-3.5.3/spark-3.5.3-bin-hadoop3.tgz
sudo tar -xvf spark-3.5.3-bin-hadoop3.tgz

cd ~
echo 'export SPARK_HOME=/opt/spark' >> ~/.bashrc
echo 'export PATH=$SPARK_HOME/bin:$PATH' >> ~/.bashrc
echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> ~/.bashrc
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bashrc

source ~/.bashrc

echo -e "versión java: $(java -version)\nversión python: $(python3 --version)"    
spark-shell
 
