from firebase import firebase 

firebase = firebase.FirebaseApplication('https://swagger-97c12.firebaseio.com/')

def get_keyvalstore():
	#firebase = firebase.FirebaseApplication('https://swagger-97c12.firebaseio.com/')
	result =firebase.get('/',None)
	return result

def set_keyvalstore(key):
	resultput = firebase.post(key,"None")

	return "Post Successfull"


