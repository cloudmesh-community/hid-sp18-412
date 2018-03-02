# Dockerizing the Swagger Rest API

## Required Software

    docker (1.6.0 or above)
    python 2.7 or above
    Linux VM - (We used ubuntu 14.04 64 bit)

# Create the Swagger App and Deployment files

Create a folder Swagger. All our files will be inside this directory, and the keyval folder should have the directory structure as /keyval/Cloudmesh/keyvaluestore2/server/keyvaluestore

The keyval folder should also contain the appropriate swagger-codegen file 

The yaml file required for the swagger-codegen input will be at the path /Swagger/keyval/Cloudmesh and these files will be mounted inside the container when we build the container.

# Swagger Application
## Create and place the Swagger-Codegen jar file that is required to for the generation of the swagger-api and create the Cloudmesh directory so that it will ease the things as we proceed 

# DockerFile 
## The below code need to be added in the Dockerfile in order to generate the build and install the docker container in the dockerfile 

	FROM ubuntu:latest
	MAINTAINER Karan Kotabagi "kkotbag@iu.edu"
	RUN apt-get update -y
	RUN apt-get install -y python-pip python-dev build-essential
	RUN apt-get install -y vim
	RUN apt-get install -y default-jdk
	RUN apt-get update -y
	COPY . /app
	WORKDIR /app
	RUN pip install -r requirments.txt
	RUN java -jar /app/Swaggerlocal/swagger-codegen-cli-2.3.1.jar generate -i /app/keyvaluestore/Cloudmesh/keyval.yaml -l python-flask -o /app/keyval/Cloudmesh/keyvaluestore/server/keyvaluestub/flaskConnexion -D supportPython2=true
	RUN pip install virtualenv
	RUN virtualenv RESTServer
	RUN /bin/bash -c "source RESTServer/bin/activate"
	RUN pip install -U pip
	RUN cd /
	RUN pwd
	RUN pip install -r /app/cpu/Cloudmesh/cputest/server/cpustub/flaskConnexion/requirements.txt
	RUN pwd 

	EXPOSE 8080

	RUN mv /app/default_controller.py /app/cpu/Cloudmesh/keyvaluestore/server/keyvaluestub/flaskConnexion/swagger_server/controllers/

	RUN mv /app/keyval_stub.py /app/cpu/Cloudmesh/keyvaluestore/server/keyvaluestub/flaskConnexion/swagger_server/controllers/

	RUN pip install requests==1.1.0
	RUN pip install python-firebase

	WORKDIR /app/cpu/Cloudmesh/keyvaluestore/server/keyvaluestub/flaskConnexion

	ENTRYPOINT ["python","-m", "swagger_server"]

# Build the docker image
Run the following command to build the docker image in the Swagger directory, here in the command we are specifying the name of the container as the swagger.

	sudo docker build -t swagger:latest .

# Run the Docker Container

Run the docker container with the below command by mapping the specfic port that is exposed to the port that we need to communicate it to from the host Operating System.

sudo docker run -d -p 8080:8080 swagger

You can find the container runtime details as shown below

	sudo docker ps
	CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
	536dccdec049        swag3               "python -m swagger_s…"   5 seconds ago       Up 4 seconds        0.0.0.0:8080->8080/tcp   hungry_mahavira

#Test GET and POST for Dockerized the Swagger-API
# GET

## Get result in the Browser
Go to http://0.0.0.0:8080/api/keyvalstore and we can fetch the respective object defined in the firestore.

## Curl Call

	curl -X GET http://0.0.0.0:8080/api/keyvaluestore
Example result of the above call:

	{
	  "KeyValueStore": {
	    "File": {
	      "Size ": "100 GB",
	      "Time Created": "January 4th 2018"
	    },
	    "Memory": {
	      "RAM Size": "16 GB"
	    },
	    "Ram": {
	      "-L4xGK_uvGZP30zLzz8R": "Dynamic"
	    },
	    "Drive2": {
	      "-L5_GRJ5JDqaz1dJuH8q": "None"
	    },
	    "Motherboard": {
	      "-L5_YK_sbqh6oiq3ptxe": "None"
	    }
	  }
	}

   
# POST

## Posting the Key value to the database 

1>The curl call for the post method is as below 

	curl -X POST http://0.0.0.0:8080/api/setkeyvalue?key=drive1

where the drive1 is key and the default value of the key is set to null.

2> Return value is "Post Successfull" if it is successfully 	   posted.

Example result of the above call:

	{
	  "KeyValueStore": "Post Successfull"
	}