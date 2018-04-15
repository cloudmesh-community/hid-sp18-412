FROM ubuntu:latest
MAINTAINER Karan Kotabagi "kkotbag@iu.edu"
RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential
RUN apt-get install -y vim
RUN apt-get install -y default-jdk
RUN apt-get update -y
COPY . /app
WORKDIR /app
RUN pip install psutil
RUN pip install --upgrade pip
RUN apt-get install wget
RUN apt-get install sudo

EXPOSE 8080

# WORKDIR /app/keyvalstore/server/keyvalstore/flaskConnexion/

RUN ls
WORKDIR /app/

RUN pwd

RUN ls

RUN make service 

CMD ["make","start"]

# ENTRYPOINT ["python","-m", "swagger_server"]