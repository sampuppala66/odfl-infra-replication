#Add the following lines to the startup profile si that env variables are set on login
sudo apt-get update
sudo apt-get install wget
sudo apt-get install postgresql-client -y
adduser --disabled-password myhvr
export HVR_HOME=/home/myhvr/hvr_home
export HVR_CONFIG=/home/myhvr/hvr_config
export HVR_TMP=/home/myhvr/hvr_tmp
export PATH=$PATH:$HVR_HOME/bin
#Create install directory
umask 022
mkdir $HVR_HOME
#Uncompress tarball into hvr_home
cd $HVR_HOME
sudo chmod 777 .
wget https://storage.googleapis.com/odfl-vm-startup-prod/hvr-6.1.0_6-hub_and_agent-linux_glibc2.12-x64-64bit_ga_patch.tar.gz
tar xzf hvr-6.1.0_6-hub_and_agent-linux_glibc2.12-x64-64bit_ga_patch.tar.gz
wget https://storage.googleapis.com/odfl-vm-startup-prod/SimbaODBCDriverforGoogleBigQuery64_2.4.6.1015.tar.gz
tar xzf SimbaODBCDriverforGoogleBigQuery64_2.4.6.1015.tar.gz
psql "sslmode=disable dbname=postgres user=postgres hostaddr=34.106.253.61"
#Start HVR listener service
hvragentlistener -d 4343
