# ** Instalación de Spark en una VM (Local)** 

##Paso 1: Editar archivo 00-installer-config.yaml
sudo nano /etc/netplan/00-installer-config.yaml

##Paso 2: Escribrir dentro del 00-installer-config.yaml:

network:
  ethernets:
     enp0s3:
         addresses:
             -192.168.56.18/24
     enp0s8:
        dhcp4: true
  version: 2

##Paso 3: Instalar Java en VM
sudo apt upgrade
sudo apt install openjdk-8-jdk
java -version

##Paso 4:Instalar Python3 en VM
sudo apt install python3
python3 -version

##Paso 5: Instalar Spark
wget https://downloads.apache.org/spark/spark-3.5.3/spark-3.5.3-bin-hadoop3.tgz
tar -xvf spark-3.5.3-bin-hadoop3.tgz
sudo mv spark-3.5.3-bin-hadoop3 /opt/spark

##Paso 6: Añadir variables de entorno al archivo Bash
sudo nano .bashrc (hace falta estar en home)

Añadir dentro del archivo:

export SPARK_HOME=/opt/spark
export PATH=$SPARK_HOME/bin:$PATH
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH

##Paso 7: Iniciar Spark
spark-shell
