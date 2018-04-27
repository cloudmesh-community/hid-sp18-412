cd /home/pi/spark-2.3.0-bin-hadoop2.6/sbin/
./start-all.sh
cd /home/pi/

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

/home/pi/spark-2.3.0-bin-hadoop2.6/bin/spark-submit word_count.py
