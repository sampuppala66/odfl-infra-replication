#Add the following lines to the startup profile si that env variables are set on login
sudo adduser myhvr --disabled-password
su myhvr
tar xzf /tmp/hvr-6.1.0-hub_and_agent-linux_glibc2.17-x64-64bit_ea.tar.gz
export HVR_HOME=/home/myhvr/hvr_home
export HVR_CONFIG=/home/myhvr/hvr_config
export HVR_TMP=/home/myhvr/hvr_tmp
export PATH=$PATH:$HVR_HOME/bin

#Create install directory
umask 022
mkdir $HVR_HOME
#Uncompress tarball into hvr_home
cd $HVR_HOME

#Start HVR listener service
hvragentlistener -d 4343
