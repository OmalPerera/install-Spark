#!/bin/bash


# To run this script first executable permision by typing followinf command in terminal
# 	$ chmod +x install-spark.sh

# Then run the script (makesure you are in the directory which the script is located)
#	$ ./install-spark.sh 


if [[ $(uname -s) = "Linux" ]]
then
    printf "\nLinux System Detected. Proceeding..."
else
    printf "\nNot a Linux system. Script will work correctly only in the Linux systems"
    exit 1
fi


printf "\n\nDISCLAIMER: This is an automated script for installing Apache Spark with it s dependencies, but feel responsible for what you're doing!"
printf "This will install Spark to your home directory, Java, git, Scala, modify your PATH variables for java; scala, and add environment variables to your SHELL config file \n"

read -r -p "Proceed? [Y/N] " response
if [[ ! $response =~ ^([yY][eE][sS]|[yY])$ ]]
then
    echo "Aborting..."
    exit 1
fi


printf "\n\n****************************** Preparing for update - upgrade ********************\n\n"
apt-get update && apt-get upgrade
printf "\n\n****************************** update - upgrade done ********************\n\n"



# ++++++++++++++++++++++++++++++++++++++ JAVA INSTALLATION +++++++++++++++++++++++++++++++++++++++ 
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

printf " --------------------------------- current jAVA Version ----------------- \n"
java -version
printf " ------------------------------------------------------------------------\n\n\n"

printf "****************************** Installing JRE *******************\n\n"
apt-get install default-jre
printf "\n\n****************************** JRE installed ********************\n\n\n\n"

printf "****************************** Installing JDK *******************\n\n"
sudo apt-get install default-jdk
printf "\n\n****************************** JDK installed ********************\n\n\n\n"

printf " --------------------------------- Updated jAVA Version ----------------- \n"
java -version
printf " ------------------------------------------------------------------------\n\n"

echo 'JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"' >> /etc/environment
source /etc/environment

echo $JAVA_HOME
printf " --------------------------------- JAVA HOME Updated ----------------- \n\n\n"



# ++++++++++++++++++++++++++++++++++++++ SCALA INSTALLATION ++++++++++++++++++++++++++++++++++++++ 
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

printf "****************************** DOWNLOADING SCALA 2.10.4 ****************************** \n\n"

mkdir /usr/local/src/scala
wget http://www.scala-lang.org/files/archive/scala-2.10.4.tgz && tar xvf scala-2.10.4.tgz -C /usr/local/src/scala/

printf " --------------------------------- setup extraced to /usr/local/src/scala/ ----------------- \n\n"

echo 'export SCALA_HOME=/usr/local/src/scala/scala-2.10.4' >> ~/.bashrc
echo 'export PATH=$SCALA_HOME/bin:$PATH' >> ~/.bashrc 

source ~/.bashrc
printf "export SCALA_HOME=/usr/local/src/scala/scala-2.10.4 \n"
printf " --------------- Exporting Scala path to .bashrc & restarting bashrc Finished------------- \n"

printf "****************************** SCALA SUCCESSFULLY INSTALLED ****************************** \n"
scala -version && printf "."
printf "****************************************************************************************** \n\n\n"



# ++++++++++++++++++++++++++++++++++++++ GIT INSTALLATION ++++++++++++++++++++++++++++++++++++++++ 
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

printf "****************************** INSTALLING GIT ****************************** \n"
apt-get install git
printf "****************************** INSTALLING GIT FINISHED ********************* \n\n\n"



# ++++++++++++++++++++++++++++++++++++++ SPARK INSTALLATION ++++++++++++++++++++++++++++++++++++++ 
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

printf "****************************** INSTALLING SPARK ****************************** \n"
printf " ------------------------------ Downloading Spark-2.2.0 ----------------------- \n"
#wget http://d3kbcqa49mib13.cloudfront.net/spark-1.1.0.tgz && tar xvf spark-1.1.0.tgz 

# Spark 1.2.0
#wget http://d3kbcqa49mib13.cloudfront.net/spark-1.2.0-bin-hadoop2.4.tgz && tar -xzvf spark-1.2.0-bin-hadoop2.4.tgz

# Spark-2.2.0
wget http://www-eu.apache.org/dist/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz && tar -xzvf spark-2.2.0-bin-hadoop2.7.tgzz

printf " ------------------------------ Extacting FInished ---------------------------- \n\n"


printf "\n------------------------------ Running a simple application ---------------------------- \n"

cd spark-2.2.0-bin-hadoop2.7/
./bin/run-example SparkPi 10
./bin/spark-shell

printf "\n\n****************************** INSTALLING SPARK FINISHED ********************* \n\n\n"



# ++++++++++++++++++++++++++++++++++++++ WHAT IS NEXT ++++++++++++++++++++++++++++++++++++++++++++ 
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

printf "\n******************************* WHAT IS NEXT ??? ****************************** \n"
printf "********************************************************************************* \n"
printf " you can run Spark interactively through the Scala shell \n"
printf "\t $ cd spark-2.2.0-bin-hadoop2.7/bin/ \n"
printf "\t $ ./spark-shell \n"
printf "\n******************************* GOOD LUCK! ************************************ \n"
printf "***************** © Omal Perera (https://github.com/OmalPerera) *****************\n\n\n"
