FROM bde2020/spark-base:2.3.0-hadoop2.7

COPY master.sh /

RUN mkdir scripts
COPY word_count.py scripts
COPY run-app.sh scripts
COPY Makefile scripts
RUN apt-get install wget -y

RUN wget -P . https://www.dropbox.com/s/oykmrl6okxqthsn/Bhagvadgita.txt

RUN wget -P . http://www.gutenberg.org/files/98/98-0.txt

RUN wget -P . http://www.gutenberg.org/files/11/11-0.txt
 
RUN wget -P . http://www.gutenberg.org/files/158/158-0.txt
 
RUN wget -P . http://www.gutenberg.org/files/30254/30254-0.txt
 
RUN wget -P . http://www.gutenberg.org/cache/epub/1661/pg1661.txt

RUN cp *.txt /scripts

ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8080
ENV SPARK_MASTER_LOG /spark/logs

RUN apt-get update -y
RUN apt-get install vim -y

EXPOSE 8080 7077 6066

CMD ["/bin/bash", "/master.sh"]
