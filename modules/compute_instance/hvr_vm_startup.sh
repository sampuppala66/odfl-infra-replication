#Add the following lines to the startup profile si that env variables are set on login
sudo apt-get update -y
sudo apt-get install wget -y
sudo apt-get install unzip -y
sudo apt-get install postgresql-client -y
adduser --disabled-password myhvr
export HVR_HOME=/home/myhvr/hvr_home
#export AGENT_HOME=/home/dynatrace_home
export HVR_CONFIG=/home/myhvr/hvr_config
export HVR_TMP=/home/myhvr/hvr_tmp
export PATH=$PATH:$HVR_HOME/bin
#Create install directory
umask 022
mkdir $HVR_HOME
#mkdir $AGENT_HOME
#Uncompress tarball into hvr_home
cd $HVR_HOME
sudo chmod 777 .
wget https://storage.googleapis.com/odfl-vm-startup-prod/hvr-6.1.0_9-hub_and_agent-linux_glibc2.12-x64-64bit_ga_patch.tar.gz
tar xzf hvr-6.1.0_9-hub_and_agent-linux_glibc2.12-x64-64bit_ga_patch.tar.gz
cd /home/myhvr
wget https://storage.googleapis.com/odfl-vm-startup-prod/SimbaODBCDriverforGoogleBigQuery_2.4.6.1015-Linux.tar.gz
sudo tar --directory=/opt -zxvf SimbaODBCDriverforGoogleBigQuery_2.4.6.1015-Linux.tar.gz
#cd $AGENT_HOME
#wget -q https://github.com/dynatrace-oss/dynatrace-gcp-function/releases/latest/download/function-deployment-package.zip -O function-deployment-package.zip
#unzip function-deployment-package.zip
#chmod a+x *.sh
#psql "sslmode=disable dbname=postgres user=postgres hostaddr=34.106.253.61"
#Start HVR listener service
hvragentlistener -d 4343
