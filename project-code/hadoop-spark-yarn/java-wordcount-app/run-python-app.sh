#!/bin/sh

cd /opt/hadoop-2.7.1/sbin/

./start-all.sh

# cd $HADOOP_CONF

# echo “export HADOOP_CLASSPATH=/usr/lib/jvm/jdk-8-oracle-arm32-vfp-hflt/lib/tools.jar” >> /hadoop-env.sh

cd /home/hduser 
sudo rm -r wordcountPython
mkdir wordcountPython

mkdir input 

cd /home/hduser/wordcountPython/input 

sudo wget -P /home/hduser/wordcountPython/input/ https://www.dropbox.com/s/oykmrl6okxqthsn/Bhagvadgita.txt
sudo wget -P /home/hduser/wordcountPython/input/ http://www.gutenberg.org/files/98/98-0.txt
sudo wget -P /home/hduser/wordcountPython/input/  http://www.gutenberg.org/files/11/11-0.txt

sudo wget -P /home/hduser/wordcountPython/input/ http://www.gutenberg.org/files/158/158-0.txt

sudo wget -P /home/hduser/wordcountPython/input/ http://www.gutenberg.org/files/30254/30254-0.txt 

sudo wget -P /home/hduser/wordcountPython/input/ http://www.gutenberg.org/cache/epub/1661/pg1661.txt

hadoop fs -rm -r /home/hduser/wordcountPython/input
hadoop fs -mkdir -p /home/hduser/wordcountPython/input                                                                                        t

hadoop dfs -copyFromLocal /home/hduser/wordcountPython/input/* /home/hduser/wordcountPython/input/

#cd /scripts/



hadoop fs -rm -r /home/hduser/output-Python

hadoop jar /opt/hadoop-2.7.1/share/hadoop/tools/lib/hadoop-streaming-2.7.1.jar -file /home/hduser/mapper.py    -mapper /home/hduser/mapper.py -file /home/hduser/reducer.py   -reducer /home/hduser/reducer.py -input /home/hduser/wordcountPython/input/* -output /home/hduser/output-Python









