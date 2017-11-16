#!/bin/bash

printf "****************************** Preparing for update - upgrade ********************\n\n"
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
scala -version
printf "****************************************************************************************** \n\n\n"






# ++++++++++++++++++++++++++++++++++++++ GIT INSTALLATION ++++++++++++++++++++++++++++++++++++++++ 
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

printf "****************************** INSTALLING GIT ****************************** \n"
apt-get install git
printf "****************************** INSTALLING GIT FINISHED ********************* \n\n\n"






# ++++++++++++++++++++++++++++++++++++++ SPARK INSTALLATION ++++++++++++++++++++++++++++++++++++++ 
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

printf "****************************** INSTALLING SPARK ****************************** \n"
printf " ------------------------------ Downloading Spark-1.1.0 ----------------------- \n"
#wget http://d3kbcqa49mib13.cloudfront.net/spark-1.1.0.tgz && tar xvf spark-1.1.0.tgz 
wget http://d3kbcqa49mib13.cloudfront.net/spark-1.2.0-bin-hadoop2.4.tgz && tar -xzvf spark-1.2.0-bin-hadoop2.4.tgz 

printf " ------------------------------ Extacting FInished ---------------------------- \n\n"


printf "\n------------------------------ Running a simple application ---------------------------- \n"
#spark-1.1.0/bin/run-example SparkPi 10
cd spark-1.2.0-bin-hadoop2.4/
./bin/run-example SparkPi 10
./bin/spark-shell
exit

printf "\n\n****************************** INSTALLING SPARK FINISHED ********************* \n\n\n"






# ++++++++++++++++++++++++++++++++++++++ WHAT IS NEXT ++++++++++++++++++++++++++++++++++++++++++++ 
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

printf "\n******************************* WHAT IS NEXT ??? ****************************** \n"
printf "********************************************************************************* \n"
printf " you can run Spark interactively through the Scala shell \n"
printf "\t $ cd spark-1.2.0-bin-hadoop2.4/bin/ \n"
printf "\t $ ./spark-shell \n"
printf "\n******************************* GOOD LUCK! ************************************ \n"
printf "***************** © Omal Perera (https://github.com/OmalPerera) *****************\n\n\n"
