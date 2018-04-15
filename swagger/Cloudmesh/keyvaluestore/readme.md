# ASSIGNMENT TO BUILD A SWAGGER REST API IN ORDER TO ACCESS THE KEYVALUESTORE AND POST THE VALUES TO THE KEYVALUESTORE, THE FIRESTORE IS USED IN THE BACKEND TO SAVE THE KEYS AND VALUES THAT THE SWAGGER API CONNECTS WITH (FIREBASE - DATABASE IS USED).

## REST API END POINTS AND THE SERVICES 

* Firebase in the google cloud platform that provides the space to store in a NO-SQL database that can accessed via cloud or other API's

* This swagger API fetches the simple keyvaluestore that is added in the firebase database 

* The post and the get methods are implemented with the below end points

	* /api/keyvaluestore

	* /api/setkeyvalue

## Steps to run the Swagger API

* Clone the project with the git clone https://github.com/cloudmesh-community/hid-sp18-412.git

* Navigate to the directory hid-sp18-412/swagger/Cloudmesh/keyvaluestore

* Run the following to create and start the docker container 

		make docker-start 

* Alternative to pull the container from hub : 
		
		make docker-pull

## All options for the running the swagger API with the make

* Build and run the docker container and start the service with the following command.

		make docker-start 

* To only build the docker container use the 
  following command 
	
		make docker-build

* To only run the container after the build 

		make docker-run

* To pull the docker container locally 
  (if it is pulled make sure to start it 
  with "make docker-start")
  
		make docker-pull

* To test the get API call after running the service

		make test-get

* To test the post API call after running the service
	
		make test-post

* To stop the docker container 
	
		make docker-stop

* To stop and delete the docker container 

		make docker-deleteall

* To start the service locally

		make all

* To clean the contents locally

		make clean

## Instructions to run the docker container
	
* The docker pull can be used to run the container 

		sudo docker pull karankotz/swagger-firebase 

		or

		make docker-pull

## Clone the Project into a folder and navigate to the directory swagger/Cloudmesh/keyvaluestore
	
		make docker-start

## Testing the dockerized swagger API 

## Get

### Get the keyvaluestore

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

### Posting the Key value to the database 

* The curl call for the post method is as below 

	curl -X POST http://0.0.0.0:8080/api/setkeyvalue?key=drive9

where the drive9 is key and the default value of the key is set to null.

* Return value is "Post Successfull" if it is successfully 	   inserted into the firestore.

Example result of the above call:

	{
	  "KeyValueStore": "Post Successfull"
	}


## The container id at the runtime can be found with the following command 
 	
	sudo docker ps

### Example of the container ID 

	CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
	536dccdec049        swag3               "python -m swagger_s…"   5 seconds ago       Up 4 seconds        0.0.0.0:8080->8080/tcp   hungry_mahavira


### References and acknowledgements 
I have referred the repositories hid-sp18-405 and hid-sp18-409 in order to create the Makefile with respect to the swagger service that I have implemented.


