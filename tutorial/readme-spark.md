## Steps for Setting up the Spark on the Rasberry Pi Cluster (Pre-requisite - Hadoop should be installed)

### Download Spark 
	1> Navigate to the path /home/hduser 
	
       cd /home/hduser 

	2> Begin the downlaod with the following command 
	
	   wget http://apache.claz.org/spark/spark-2.3.0/spark-2.3.0-bin-hadoop2.7.tgz
	   
	   
	3> Unzip the tar file of the spark
	
	   tar -xzf spark-2.3.0-bin-hadoop2.7.tgz
	   
	4> Move the spark that is extracted to the directory /opt/
		
	   sudo  mv spark-2.3.0-bin-hadoop2.7 /opt/
	   
	5> Navigate to the directory /opt/spark-2.3.0-bin-hadoop2.7/conf
	
	   cd /opt/spark-2.3.0-bin-hadoop2.7/conf
	   
	6> Copy the template from spark-env.sh.template to spark-env.sh
	
		cp spark-env.sh.template spark-env.sh
		
	7> Open spark-env.sh then set the spark host and the worker memory.
		
		vi spark-env.sh
		- SPARK_MASTER_HOST = 169.254.24.132
		- SPARK_WORKER_MEMORY = 512m