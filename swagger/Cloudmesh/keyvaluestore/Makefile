SWAGGERCODEGEN=java -jar swagger-codegen-cli-2.3.1.jar
YAML=keyval.yaml
EXECDIR=keyvaluestore/
OUTPUT=keyvaluestore/
REQDIR=keyvaluestore/server/flaskConnexion
RESTSERV=RESTServer

all: service start 
	
service:
	mkdir $(EXECDIR)
	chmod 777 $(EXECDIR)
	wget https://www.dropbox.com/s/0730xoz8rboes7b/swagger-codegen-cli-2.3.1.jar
	$(SWAGGERCODEGEN) generate \
	-i $(YAML) \
	-l python-flask \
	-o $(OUTPUT) \
	-D supportPython2=true 

	sudo pip install virtualenv

	sudo virtualenv $(RESTSERV)

	sudo chmod 777 $(RESTSERV)

	sudo pip install requests==1.1.0 

	sudo pip install python-firebase

	cp -r *.py $(EXECDIR)/swagger_server/controllers

	cd $(EXECDIR) && sudo pip install -r requirements.txt

	cd ..

start:
	cd $(EXECDIR) && python -m swagger_server
	cd ..

test-get: 
	curl http://0.0.0.0:8080/api/keyvaluestore 

test-post:
	curl -X POST http://0.0.0.0:8080/api/setkeyvalue?key=drive4

docker-start: docker-build docker-run

docker-build:
	sudo docker build -t karankotz/swagger-firebase:latest .

docker-run:
	sudo docker run -d -p 8080:8080 karankotz/swagger-firebase

docker-stop:
	sudo docker stop $$(sudo docker ps -alq)

docker-pull:
	sudo docker pull karankotz/swagger-firebase

docker-delete:
	sudo docker rmi -f karankotz/swagger-firebase

docker-deleteall: docker-stop docker-delete

clean: 
		sudo rm -rf $(OUTPUT)
		sudo rm *.jar
		sudo rm -rf $(RESTSERV)
