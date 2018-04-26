build-all: 
	 sh build.sh 

run-master:
	-sudo docker rm spark-master
	sudo docker run --name spark-master -h spark-master -e ENABLE_INIT_DAEMON=false -d bde2020/spark-master:2.3.0-hadoop2.7

run-workers:
	-sudo docker stop spark-worker-1
	-sudo docker rm spark-worker-1

	-sudo docker stop spark-worker-2
	-sudo docker rm spark-worker-2


	-sudo docker stop spark-worker-3
	-sudo docker rm spark-worker-3

	-sudo docker stop spark-worker-4
	-sudo docker rm spark-worker-4


	sudo docker run --name spark-worker-1 --link spark-master:spark-master -e ENABLE_INIT_DAEMON=false -d bde2020/spark-worker:2.3.0-hadoop2.7
	sudo docker run --name spark-worker-2 --link spark-master:spark-master -e ENABLE_INIT_DAEMON=false -d bde2020/spark-worker:2.3.0-hadoop2.7
	sudo docker run --name spark-worker-3 --link spark-master:spark-master -e ENABLE_INIT_DAEMON=false -d bde2020/spark-worker:2.3.0-hadoop2.7
	sudo docker run --name spark-worker-4 --link spark-master:spark-master -e ENABLE_INIT_DAEMON=false -d bde2020/spark-worker:2.3.0-hadoop2.7

login-master:
	sudo docker exec -it spark-master /bin/bash 
stop-all:
	-sudo docker stop spark-master 
	-sudo docker stop spark-worker-1
	-sudo docker stop spark-worker-2
	-sudo docker stop spark-worker-3 
	-sudo docker stop spark-worker-4

remove-all: 
	-sudo docker stop spark-master 
	-sudo docker stop spark-worker-1
	-sudo docker stop spark-worker-2
	-sudo docker stop spark-worker-3 
	-sudo docker stop spark-worker-4

	-sudo docker rm spark-master 
	-sudo docker rm spark-worker-1
	-sudo docker rm spark-worker-2
	-sudo docker rm spark-worker-3
	-sudo docker rm spark-worker-4

