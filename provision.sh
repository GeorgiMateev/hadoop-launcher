emptyString=""
m="maven"
if [[ $(ls /home/vagrant | grep "$m") == "$emptyString" ]]
    then
        wget ftp://mirror.reverse.net/pub/apache/maven/maven-3/3.1.1/binaries/apache-maven-3.1.1-bin.tar.gz

        tar -xvf apache-maven-3.1.1-bin.tar.gz
        mv apache-maven-3.1.1 maven
fi

h="HADOOP_HOME"
if [[ $(printenv | grep "$h") == "$emptyString" ]]
   then
sudo sh -c "cat >> /etc/environment" << 'EOF'
export HADOOP_HOME=/home/vagrant/hadoop-2.7.0
export MAVEN_HOME=/home/vagrant/maven
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/jre
PATH=$PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin:$HADOOP_HOME/bin
export PATH
EOF
fi

#set env var's
source /etc/environment
#clean up
sudo rm *.tar.*