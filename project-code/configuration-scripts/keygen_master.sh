#!/bin/bash  
echo "Starting Script"
cd ~
mkdir .ssh
echo "\n\n\n" | ssh-keygen -t rsa -P ""	
cat /home/pi/.ssh/id_rsa.pub >> /home/pi/.ssh/authorized_keys	
cd ~/.ssh
chmod 600 authorized_keys
Cd ~/.ssh
scp id_rsa.pub pi@raspberrypislave1:/home/pi/.ssh/authorized_keys
scp id_rsa.pub pi@raspberrypislave2:/home/pi/.ssh/authorized_keys
scp id_rsa.pub pi@raspberrypislave3:/home/pi/.ssh/authorized_keys
scp id_rsa.pub pi@raspberrypislave4:/home/pi/.ssh/authorized_keys
