
Swagger REST Service for retreving the Keyvalue store and setting a key in the remote firebase database#

The cloudmesh directory contains the two sub-folders.

The keyvaluestore implements the swagger rest service with respect to the 
keyvalue-store object.

I have choosen the firestore cloud  and implemented the object to be displayed 
from firestore by connecting to the firebase database.

This object has the key and the value that can be displayed with the below 
instructions.

1> Navigate to the directory Cloudmesh/keyvaluestore/server/cpu/flaskConnexion

2> Execute the command python -m swagger_server

3> Go to http://0.0.0.0:8080/api/keyvalstore

and we can fetch the respective object defined in the firestore.


* https://github.com/cloudmesh-community/hid-sp18-412/blob/master/swagger/Cloudmesh/keyvaluestore/server/cpu/flaskConnexion/swagger_server/controllers/keyval_stub.py
