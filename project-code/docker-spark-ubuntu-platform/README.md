## Git clone the project and navigate to the directory hid-sp18-412/project-code/docker-spark-ubuntu-platform/

##Build all the containers using the following command 
	
	make build-all

##Run the master using the command 

	make run-master

##Run the workers using the command 

	make run-workers 

##Login to the master using 

	make login-master

##Next few of the configurations need to be performed manually in the master container 

### Navigate to the /spark/conf
	
	cd spark/conf

#### Rename the slaves template to slaves in the spark/conf  

	mv slaves.template slave 

#### Rename the spark-defaults.conf.template to spark-defaults.conf and run the subsequent command to update the line in the spark-default.conf file

	mv spark-defaults.conf.template spark-defaults.conf

	echo "spark.master spark://spark-master:7077" >> spark-defaults.conf

### Add the IP addresses of the slaves in the master /etc/hosts file 
	
	vi /etc/hosts 

Copy paste the IP adresses of the spark worker containers which can be found by "sudo docker inspect <container-name>" and the following is the example set of IP addresses posted in the built master container 

	172.17.0.2     spark-master
	172.17.0.3     spark-worker-1
	172.17.0.4     spark-worker-2
	172.17.0.5     spark-worker-3
	172.17.0.6     spark-worker-4

### Add the host names of the workers in the slaves file depending on the name of the workers and the master specified in the docker-compose file  

	spark-master
    spark-worker-1
	spark-worker-2
	spark-worker-3
	Spark-worker-4


### Navigate to the /scripts/ and run the spark-submit job in the logged in master container 

	cd scripts/

	/spark/bin/spark-submit word_count.py 

#### The Web UI to monitor the job running can be accessed with the following URL by using the master containers IP address 

	http://<master-IP>:8080
	Example: <http://172.17.0.2:8080/>

### Output Example:

https://www.dropbox.com/s/flids2li7gmt2je/Docker-Spark-Results.PNG?dl=0

### References: 
The dockerfiles and images used to build the Docker-Spark architeture  
were referenced from the following github repository link and updated accordingly 
to suit the requirements <https://github.com/big-data-europe/docker-spark?files=1
