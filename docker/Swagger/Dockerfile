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
RUN java -jar /app/Swaggerlocal/swagger-codegen-cli-2.3.1.jar generate -i /app/keyval/Cloudmesh/keyval.yaml -l python-flask -o /app/keyval/Cloudmesh/keyvalstore/server/keyvalstore/flaskConnexion -D supportPython2=true
RUN pip install virtualenv
RUN virtualenv RESTServer
RUN /bin/bash -c "source RESTServer/bin/activate"
RUN pip install -U pip
RUN cd /
RUN pwd
RUN pip install -r /app/keyval/Cloudmesh/keyvalstore/server/keyvalstore/flaskConnexion/requirements.txt
RUN pwd 

EXPOSE 8080

RUN mv /app/default_controller.py /app/keyval/Cloudmesh/keyvalstore/server/keyvalstore/flaskConnexion/swagger_server/controllers/

RUN mv /app/keyval_stub.py /app/keyval/Cloudmesh/keyvalstore/server/keyvalstore/flaskConnexion/swagger_server/controllers/

RUN pip install requests==1.1.0
RUN pip install python-firebase

WORKDIR /app/keyval/Cloudmesh/keyvalstore/server/keyvalstore/flaskConnexion/

ENTRYPOINT ["python","-m", "swagger_server"]









