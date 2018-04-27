FROM bde2020/spark-base:2.3.0-hadoop2.7

COPY worker.sh /

ENV SPARK_WORKER_WEBUI_PORT 8081
ENV SPARK_WORKER_LOG /spark/logs
ENV SPARK_MASTER "spark://spark-master:7077"

RUN apt-get update -y
RUN apt-get install vim -y

RUN mkdir scripts

RUN apt-get install wget

RUN wget -P . http://www.gutenberg.org/files/98/98-0.txt

RUN wget -P . http://www.gutenberg.org/files/11/11-0.txt
 
RUN wget -P . http://www.gutenberg.org/files/158/158-0.txt
 
RUN wget -P . http://www.gutenberg.org/files/30254/30254-0.txt
 
RUN wget -P . http://www.gutenberg.org/cache/epub/1661/pg1661.txt

RUN cp *.txt /scripts

EXPOSE 8081

CMD ["/bin/bash", "/worker.sh"]
