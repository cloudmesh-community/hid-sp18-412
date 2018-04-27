#!/bin/sh

cd /opt/hadoop-2.7.1/sbin/

sh start-all.sh

# cd $HADOOP_CONF

# echo “export HADOOP_CLASSPATH=/usr/lib/jvm/jdk-8-oracle-arm32-vfp-hflt/lib/tools.jar” >> /hadoop-env.sh

cd /home/hduser 

mkdir wordcount

mkdir input1 

cd /home/hduser/wordcount/input1 

sudo wget -P /home/hduser/wordcount/input1/ https://www.dropbox.com/s/oykmrl6okxqthsn/Bhagvadgita.txt

sudo wget -P /home/hduser/wordcount/input1/ http://www.gutenberg.org/files/98/98-0.txt

sudo wget -P /home/hduser/wordcount/input1/ http://www.gutenberg.org/files/11/11-0.txt

sudo wget -P /home/hduser/wordcount/input1/ http://www.gutenberg.org/files/158/158-0.txt

sudo wget -P /home/hduser/wordcount/input1/ http://www.gutenberg.org/files/30254/30254-0.txt

sudo wget -P /home/hduser/wordcount/input1/ http://www.gutenberg.org/cache/epub/1661/pg1661.txt

hadoop fs -rm -r /home/hduser/wordcount/

hadoop fs -mkdir -p /home/hduser/wordcount/input1                                                                                        t

hadoop dfs -copyFromLocal /home/hduser/wordcount/input1/* /home/hduser/wordcount/input1/

cd /scripts/

#hadoop com.sun.tools.javac.Main WordCount.java

sudo /opt/hadoop-2.7.1/bin/hadoop com.sun.tools.javac.Main WordCount.java

sudo jar cf wc.jar WordCount*.class 

hadoop fs -rm -r /home/hduser/wordcount/output/output-java

hadoop jar wc.jar WordCount /home/hduser/wordcount/input1/* /home/hduser/wordcount/output/output-java





