#!/bin/sh

#cd /opt/hadoop-2.7.1/sbin/

#sh start-all.sh

cd $HADOOP_CONF

echo “export HADOOP_CLASSPATH=/usr/lib/jvm/jdk-8-oracle-arm32-vfp-hflt/lib/tools.jar” >> /hadoop-env.sh

cd /home/hduser 

mkdir wordcount

mkdir input 

cd /home/hduser/wordcount/input 

sudo wget -P /home/hduser/wordcount/input/ https://www.dropbox.com/s/oykmrl6okxqthsn/Bhagvadgita.txt

hadoop fs -mkdir -p /home/hduser/wordcount/input/                                                                                        t

hadoop dfs -copyFromLocal /home/hduser/wordcount/input/Bhagvadgita.txt /home/hduser/wordcount/input/

cd /scripts/

#hadoop com.sun.tools.javac.Main WordCount.java

sudo /opt/hadoop-2.7.1/bin/hadoop com.sun.tools.javac.Main WordCount.java

sudo jar cf wc.jar WordCount*.class 

hadoop jar wc.jar WordCount /home/hduser/wordcount/input/ /home/hduser/wordcount/output/output-java



