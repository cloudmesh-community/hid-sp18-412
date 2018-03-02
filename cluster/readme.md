# Steps Rasberry pi for setting up Hadoop Spark Cluster

First,  Login to the terminal and change password for the rasberry pi 

	passwd pi
	Enter the password as the snowcluster 

Next, use `raspi-config` to configure the OS from a terminal window

	sudo raspi-config in a terminal window

In the configuration do the following

1. Select Interfacing Options
2. Navigate to and select SSH
3. Choose Yes
4. Select Ok
5. Choose Finish

Now, we need to check if we are able to connect to the rasberry pi from the different pc or another rasberry pi.  
Login to the Rasberry pi 1, and type in a terminal 

	ifconfig
	
TODO: THE NEXT STEP OTHERS CAN NOT UNDERSTAND

We use this command to identify the etho ipaddress returned via `ifconfig` command. We connect the same ethernet to a laptop and do the ssh of the respective raspberry pi 1 ip address to check if the ssh has been successfully enabled.

TODO: CORRECT MD FORMAT TO MAKE IT CONSISTENT WITH THE ABOUVE

4> Next repeat the steps from the 1 to 3 on all other 4 rasberry pi’s.


	HostNames
	sudo vi /etc/hosts

	piHadoopmaster 169.254.24.132
	piHadoopslave1  169.254.35.145
	piHadoopslave2  169.254.87.91
	piHadoopslave3   169.254.225.63
	piHadoopslave4   169.254.190.73

After changing then reboot the node.

Login to the slave1 then, open the `etc/hosts` and update it as below
	
	169.254.35.145 PiHadoopSlave1
	169.254.24.132 PiHadoopMaster

Then reboot and verify the hostname with command:

	hostname
	hostname -i

Now repeat this step for all other workers.

TOD DO WHAT IS THE STEP, WHERE DOES IT START HEADLINE MISSING


Next connect to the master (make sure to check the hostname)

Create hadoop group with the below command 

	sudo addgroup hadoop

		Hduser added to the hadoop group
	
	Sudo adduser --ingroup hadoop hduser 

		Add hduser to the sudoers list 
		Sudo adduser hduser sudo

Next, Switch user to the hduser

	su hduser 
	(password: snowcluster)

Generate the ssh key as with the below command 

	CD ~
	mkdir .ssh 
	ssh-keygen  -t rsa -P “”

	cat /home/hduser/.ssh/id_rsa.pub >> /home/hduser/.ssh/authorized_keys
	chmod 600 authorized_keys

Copy this key to  master/slave-1 to enable password less ssh 

	ssh-copy-id -i ~/.ssh/id_rsa.pub <hostname of master/slave-1>

Make sure you can do a password less ssh using following command.

	$ ssh <hostname of master/slave-1>

Login to the hduser 

	su hduser
	sudo cat 

Copy the contents from the id_rs.pub to the authorized_keys.

	sudo cat /home/hduser/.ssh/id_rsa.pub >> /home/hduser/.ssh/authorized_keys


Next we need to install the elephant in the room called Hadoop. Download the hadoop with the below command 

	wget ftp://apache.belnet.be/mirrors/ftp.apache.org/hadoop/common/hadoop-2.7.1/hadoop-2.7.1.tar.gz 

Navigate to that directory (if the directory error message occurs that it already exists then continue)

	sudo mkdir /opt  
	cd ~
	sudo tar -xvzf hadoop-2.7.1.tar.gz -C /opt/  
	cd /opt  
	sudo chown -R hduser:hadoop hadoop-2.7.1/ 

After doing it in master, repeat the same for all masters. Setting the Environment Variables by modifyiong the bashrc file

	vi ~/.bashrc

Copy the below lines at the end of the bashrc file 

	export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:jre/bin/java::")  
	export HADOOP_HOME=/opt/hadoop-2.7.1  
	export HADOOP_MAPRED_HOME=$HADOOP_HOME  
	export HADOOP_COMMON_HOME=$HADOOP_HOME  
	export HADOOP_HDFS_HOME=$HADOOP_HOME  
	export YARN_HOME=$HADOOP_HOME  
	export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop  
	export YARN_CONF_DIR=$HADOOP_HOME/etc/hadoop  
	export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin 

Execute 

	source ~/.bashrc
	hadoop version

You will see output similar to 
	
	Hadoop 2.7.1
	Subversion https://git-wip-us.apache.org/repos/asf/hadoop.git -r 15ecc87ccf4a0228f35af08fc56de536e6ce657a
	Compiled by jenkins on 2015-06-29T06:04Z
	Compiled with protoc 2.5.0
	From source with checksum fc0a1a23fc1868e4d5ee7fa2b28a58a
	This command was run using /opt/hadoop-2.7.1/share/hadoop/common/hadoop-common-2.7.1.jar

e) Repeat the steps from a to d to all the slaves.



## Configure hadoop

Login to the master and go to the directory that contains all the configuration files of Hadoop. We want to edit the `hadoop-env.sh` file. For some reason we need to configure `JAVA_HOME` manually in this file, Hadoop seems to ignore our $JAVA_HOME.
Execute the below command to go the 
	
	cd $HADOOP_CONF_DIR

TODO, THOS COULD JUST BE DONE WITH A SCRIPT

bcd $HADOOP_CONF_DIR  

Open the hadoop-env.sh file.

	vi hadoop-env.sh 

	# The java implementation to use.
     	export JAVA_HOME=/usr/lib/jvm/jdk-8-oracle-arm32-vfp-hflt/jre/

Repeat teh configuration step for all slaves

	

## Edit of the Xml Files

Files that need to be edited include now the XML files. You just have to paste the code bits below between the configuration tags.

TOIDO CAN WE NOT JUST GET THEM IN A REPO OR HAVE A PRG CREATING THEM? ALSO SSH CP COULD BE USED SO WE DO NOT HAVE TO LOG INTO EVERY MACHINE BY HAND

	 vi core-site.xml  

Add the text

	<configuration>
	<property>
	  <name>fs.default.name</name>
	  <value>hdfs://PiHadoopMaster:54310</value>
	</property>
	<property>
	  <name>hadoop.tmp.dir</name>
	  <value>/hdfs/tmp</value>
	</property>
	</configuration>



	Next xml file,
	b>
	vi hdfs-site.xml  
	<configuration>
	<property>
	<name>dfs.replication</name>
	<value>1</value>
	<property>
	  <name>fs.default.name</name>
	  <value>hdfs://PiHadoopMaster:54310</value>
	</property>
	<property>
	  <name>hadoop.tmp.dir</name>
	  <value>/hdfs/tmp</value>
	</property>
	</property>  



 Rename the existing `mapred-site.xml.template` to the `mapred-site.xml`

	cp mapred-site.xml.template mapred-site.xml  

Open the mapred-site.xml file 

	vi mapred-site.xml  


Then copy the below code to the file

	  <property>
	    <name>mapreduce.framework.name</name>
	    <value>yarn</value>
	  </property>
	  <property>
	    <name>mapreduce.map.memory.mb</name>
	    <value>256</value>
	  </property>
	  <property>
	    <name>mapreduce.map.java.opts</name>
	    <value>-Xmx210m</value>
	  </property>
	  <property>
	    <name>mapreduce.reduce.memory.mb</name>
	    <value>256</value>
	  </property>
	  <property>
	    <name>mapreduce.reduce.java.opts</name>
	    <value>-Xmx210m</value>
	  </property>
	  <property>
	    <name>yarn.app.mapreduce.am.resource.mb</name>
	    <value>256</value>
	  </property>


The first property tells us that we want to use Yarn as the MapReduce framework. The other properties are some specific settings for our Raspberry Pi. For example we tell that the Yarn Mapreduce Application Manager gets 256 megabytes of RAM and so does the Map and Reduce containers. These values allow us to actually run stuff, the default size is 1,5GB which our Pi can't deliver with its 1GB RAM.


Open the `yarn-site.xml`

	vi yarn-site.xml  


	<configuration>
	<property>
	<name>dfs.replication</name>
	<value>1</value>
	<property>
	  <name>fs.default.name</name>
	  <value>hdfs://PiHadoopMaster:54310</value>
	</property>
	<property>
	  <name>hadoop.tmp.dir</name>
	  <value>/hdfs/tmp</value>
	</property>
	</property>

	</configuration>

	*******************
	(For Master Change script to the below in the xml)
	Yarn-site.xml
	<configuration>
	 <property>
	    <name>yarn.nodemanager.aux-services</name>
	    <value>mapreduce_shuffle</value>
	  </property>
	  <property>
	    <name>yarn.nodemanager.resource.cpu-vcores</name>
	    <value>4</value>
	  </property>
	  <property>
	    <name>yarn.nodemanager.resource.memory-mb</name>
	    <value>1024</value>
	  </property>
	  <property>
	    <name>yarn.scheduler.minimum-allocation-mb</name>
	    <value>128</value>
	  </property>
	  <property>
	    <name>yarn.scheduler.maximum-allocation-mb</name>
	    <value>1024</value>
	  </property>
	  <property>
	    <name>yarn.scheduler.minimum-allocation-vcores</name>
	    <value>1</value>
	  </property>
	  <property>
	    <name>yarn.scheduler.maximum-allocation-vcores</name>
	    <value>4</value>
	  </property>
	 <property>
	   <name>yarn.nodemanager.vmem-check-enabled</name>
	   <value>false</value>
	   <description>Whether virtual memory limits will be enforced for containers</description>
	</property>
	<property>
	   <name>yarn.nodemanager.vmem-pmem-ratio</name>
	   <value>4</value>
	   <description>Ratio between virtual memory to physical memory when setting memory limits for containers</description>
	</property>
	<property>
	  <name>yarn.resourcemanager.resource-tracker.address</name>
	  <value>RaspberryPiHadoopMaster:8025</value>
	</property>
	<property>
	  <name>yarn.resourcemanager.scheduler.address</name>
	  <value>RaspberryPiHadoopMaster:8030</value>
	</property>
	<property>
	 <name>yarn.resourcemanager.address</name>
	 <value>RaspberryPiHadoopMaster:8040</value>
	</property>
	</configuration>


This file tells Hadoop some information about this node, like the maximum number of memory and cores that can be used. We limit the usable RAM to 768 megabytes, that leaves a bit of memory for the OS and Hadoop. A container will always receive a memory amount that is a multitude of the minimum allocation, 128 megabytes. For example a container that needs 450 megabytes, will get 512 megabytes assigned.

Prepare the HDFS directory by executing the below commands 

	sudo mkdir -p /hdfs/tmp  
	sudo chown hduser:hadoop /hdfs/tmp  
	chmod 750 /hdfs/tmp  
	hdfs namenode -format 

Booting Hadoop

	cd $HADOOP_HOME/sbin  
	start-dfs.sh  
	start-yarn.sh 

If you want to verify that everything is working you can use the jps command. In the output of this command you can see that Hadoop components like the NameNode are running. The numbers can be ignored, they are process numbers.

	We can see the below output by executing the jps command 
	1297 NameNode
	1815 NodeManager
	1578 SecondaryNameNode
	1387 DataNode
	1723 ResourceManager
	2125 Jps

Go to Hadoop conf directory 

	cd $HADOOP_CONF_DIR
	vi slaves 

Then copy paste the below content 

	PiHadoopMaster
	PiHadoopSlave1
	PiHadoopSlave2
	PiHadoopSlave3
	PiHadoopSlave4

	[slave 1,2,3 configured till setting JAVA_HOME path in hadoop-env.sh under HADOOP_CONF_DIR]

WHAT IS THE LATS LINE IS THIS CORRECT?

Yarn configuration of the xml files in the below steps 
Navigate to the Hadoop Conf directory with the command 

	cd $HADOOP_CONF_DIR


```vi yarn-site.xml```
Copy paste the below content:

	<property>  
	<name>yarn.resourcemanager.resource-tracker.address</name>  
	<value>PiHadoopMaster:8025</value>  
	</property>  
	<property>  
	<name>yarn.resourcemanager.scheduler.address</name>  
	<value>PiHadoopMaster:8030</value>  
	</property>  
	<property>  
	<name>yarn.resourcemanager.address</name>  
	<value>PiHadoopMaster:8040</value>  
	</property>  

We also need to edit our `core-site.xml` on all our nodes so that it looks like this:
vi core-site.xml

	<configuration>  
	<property>  
	<name>fs.default.name</name>  
	<value>hdfs://PiHadoopMaster:54310</value>  
	</property>  
	<property>  
	<name>hadoop.tmp.dir</name>  
	<value>/hdfs/tmp</value>  
	</property>








 














