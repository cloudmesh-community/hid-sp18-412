#!/bin/bash  
echo "Starting the key generator script"
cd ~
mkdir .ssh
echo "\n\n\n" | ssh-keygen -t rsa -P ""	
cat /home/pi/.ssh/id_rsa.pub >> /home/pi/.ssh/authorized_keys	
cd ~/.ssh
chmod 600 authorized_keys
scp id_rsa.pub pi@raspberrypimaster:/home/pi/.ssh/authorized_keys
