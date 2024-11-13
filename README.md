# **Instalación de Spark en una VM (Local)**  

## Paso 1: Instalar Java en VM
Instalamos Java8 
``` bash
# Actualizamos la Vm a la última versión
sudo apt upgrade
# Instalamos el java openjdk-8-jdk
sudo apt install openjdk-8-jdk
# Comprobamos la versión de Java para comprobar su correcta instalación
java -version
``` 
## Paso 2:Instalar Python3 en VM
``` bash
# Instalamos Python3 en la VM
sudo apt install python3
# Comprobamos la versión de python3
python3 -version
``` 
## Paso 3: Instalar Spark
``` bash
# Nos conectamos a internet para conseguir el .tar que contiene spark
wget https://downloads.apache.org/spark/spark-3.5.3/spark-3.5.3-bin-hadoop3.tgz
# Descomprimimos el tar 
tar -xvf spark-3.5.3-bin-hadoop3.tgz
# Movemos el contenido del tar a /opt/spark
sudo mv spark-3.5.3-bin-hadoop3 /opt/spark
``` 
## Paso 4: Añadir variables de entorno al archivo .bashrc
``` bash
# Abrimos el editor de texto para editar el archivo .bashrc
sudo nano .bashrc (hace falta estar en home)
```
Añadir variables de entorno al archivo:
``` bash
export SPARK_HOME=/opt/spark
export PATH=$SPARK_HOME/bin:$PATH
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
``` 
## Paso 5: Iniciar Spark
``` bash
spark-shell
``` 
------------------------------------------------------

### OPCIONAL. Para trabajar con redes privadas

## Paso 1: Editar archivo 00-installer-config.yaml
``` bash
# Abrimos el editor de texto para editar el archivo 00-installer-config.yaml
sudo nano /etc/netplan/00-installer-config.yaml
```
## Paso 2: Escribrir dentro del 00-installer-config.yaml:
Configuramos el contenido de 00-installer-config.yaml
``` bash
network:
  ethernets:
     enp0s3:
         addresses:
             -192.168.56.18/24
     enp0s8:
        dhcp4: true
  version: 2
  ```
