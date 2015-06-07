wget ftp://mirror.reverse.net/pub/apache/maven/maven-3/3.1.1/binaries/apache-maven-3.1.1-bin.tar.gz

tar -xvf apache-maven-3.1.1-bin.tar.gz
mv apache-maven-3.1.1 maven

sudo sh -c "cat >>/ etc/environment" << 'EOF'
export HADOOP_HOME=/home/vagrant/hadoop-2.7.0
export MAVEN_HOME=/home/vagrant/maven
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk/jre
PATH=$PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin:$HADOOP_HOME/bin
export PATH
EOF
#set env var's
source /etc/environment
#clean up
sudo rm *.tar.*