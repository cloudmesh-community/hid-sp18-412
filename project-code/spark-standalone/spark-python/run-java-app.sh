export M2_HOME=/opt/apache-maven-3.0.5
export M2=$M2_HOME/bin
PATH=$M2:$PATH 

mvn -v

if [ "$?" -ne 0 ]; then
    cd /home/pi
    mkdir temp
    cd temp
    wget http://mirrors.gigenet.com/apache/maven/maven-3/3.0.5/binaries/apache-maven-3.0.5-bin.tar.gz
    echo snowcluster | sudo -S tar -zxvf apache-maven-3.0.5-bin.tar.gz -C /opt/

    # Add the following lines to maven.sh
else
    echo "Maven already installed"
fi

mvn -v 

if [ "$?" -ne 0 ]; then
    echo "Maven installion Unsuccessful! Try installing maven manually and try again"
    exit 1
else
   echo "Maven installed"
fi

rm -rf /home/pi/temp

cd /home/pi/spark-2.3.0-bin-hadoop2.6/sbin/
./start-all.sh
cd /home/pi/spark_java_app

if [ "$?" -ne 0 ]; then
    echo "source file does not exits in home folder"
    exit 1
fi
    
mvn package

cd /home/pi

wget -P . https://www.dropbox.com/s/oykmrl6okxqthsn/Bhagvadgita.txt

wget -P . http://www.gutenberg.org/files/98/98-0.txt

wget -P . http://www.gutenberg.org/files/11/11-0.txt

wget -P . http://www.gutenberg.org/files/158/158-0.txt

wget -P . http://www.gutenberg.org/files/30254/30254-0.txt

wget -P . http://www.gutenberg.org/cache/epub/1661/pg1661.txt

#Push all files to every worker node
scp *.txt pi@169.254.159.13:/home/pi
scp *.txt pi@169.254.4.141:/home/pi
scp *.txt pi@169.254.91.84:/home/pi
scp *.txt pi@169.254.39.178:/home/pi

cd /home/pi/spark_app_java/target

/home/pi/spark-2.3.0-bin-hadoop2.6/bin/spark-submit SparkContext-1.0-SNAPSHOT-jar-with-dependencies.jar

