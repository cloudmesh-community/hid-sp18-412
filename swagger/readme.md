
# Swagger REST Service for retreving the Keyvalue store and setting a key in the remote firebase database

The cloudmesh directory listed contains the two sub-folders and the keyval.yaml file which defines the API schema.

The keyvaluestore2 implements the swagger rest service with respect to the keyvaluestore object.

The firestore cloud is connected to the service in the backend
and implemented for the object to be displayed from firestore by connecting to the firebase database.

# GET
## This object has the key and the value that can be displayed with the below instructions.

1> Navigate to the directory Cloudmesh/keyvaluestore/server/cpu/flaskConnexion

2> Execute the command python -m swagger_server

3>(In Browser) Go to http://0.0.0.0:8080/api/keyvalstore and we can fetch the respective object defined in the firestore.

3> Curl Call

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


## The files that are changed are mentioned in the below links:

## keyval.yaml

* https://github.com/cloudmesh-community/hid-sp18-412/blob/master/swagger/Cloudmesh/keyval.yaml

## default_controller.py

* https://github.com/cloudmesh-community/hid-sp18-412/blob/master/swagger/Cloudmesh/keyvaluestore2/server/keyvaluestore/flaskConnexion/swagger_server/controllers/default_controller.py

## keyval_stub.py

* https://github.com/cloudmesh-community/hid-sp18-412/blob/master/swagger/Cloudmesh/keyvaluestore2/server/keyvaluestore/flaskConnexion/swagger_server/controllers/keyval_stub.py

