HADOOP_EXEC=/opt/hadoop-2.7.1/sbin/
SCRIPT_DIR = /scripts/

start-all:
	 cd $(HADOOP_EXEC) 
	 start-all.sh

stop-all:
	 cd $(HADOOP_EXEC)
	 ./stop-all.sh 

run-wordcount-java:
	           # cp WordCount.java /scripts/
	           # cp run-app.sh /scripts/
	           cd $(SCRIPT_DIR)
	           sh run-app.sh 

remove-all:
	  cd $(SCRIPT_DIR)
	  sudo rm -rf wc.jar
	  cd /home/hduser 
	  sudo rm -rf wordcount
	  

		
