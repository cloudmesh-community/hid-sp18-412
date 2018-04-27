This is Java application to perform the word count calculations on the Raspberry
Pi Standalone Spark Cluster. Before performing the below steps, Raspberry should
be neatly configured as standalone spark cluster.

Steps to run the application:

step 1: Clone the repository <br  />
		`git clone https://github.com/cloudmesh-community/hid-sp18-412.git`

step 2: Copy the code contents <br  />
		`cp hid-sp18-412/project-code/spark-standalone/spark-java/spark_java_app /home/pi`

step 3: Copy Makefile and run-java-app.sh into /scripts <br  />
		`cd hid-sp18-412/project-code/spark-standalone/spark-java/spark_java_app`
		`cp Makefile run-java-app.sh /scripts`

step 4: Navigate to <br  />
		`cd /scripts`

step 5: Run following command to execute the app <br  />
		`make run-java`

		

