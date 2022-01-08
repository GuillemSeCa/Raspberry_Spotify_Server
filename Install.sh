#!/bin/bash

sudo apt install raspberrypi-kernel-headers

sudo apt update

#TODO: demana el 'Y'
sudo apt install apache2

sudo apt-get install xrdp
sudo a2enmod cgid
sudo systemctl restart apache2

#TODO: Instalem git per crear els scripts al lloc corresponent
sudo apt-get install git
git clone https://github.com/GuillemSeCa/Raspberry_Spotify_Server $HOME/Desktop
cd $HOME/Desktop && git checkout dev

cd $HOME/Desktop/code && make && sudo insmod LKM.ko && cp A.sh /home/pi/A.sh && cp B.sh /home/pi/B.sh && cp C.sh /home/pi/C.sh && cp D.sh /home/pi/D.sh && chmod +x /home/pi/A.sh /home/pi/B.sh /home/pi/C.sh /home/pi/D.sh

sudo cp -r $HOME/Desktop/* /usr/lib/cgi-bin

sudo chmod -R 755 /usr/lib/cgi-bin
echo 'www-data ALL=(ALL) NOPASSWD: ALL' | sudo EDITOR='tee -a' visudo

#Per transofrmar \n s de Windows a format Unix
sudo apt-get install dos2unix
cd /usr/lib/gci-bin && sudo find . -type f -print0 | sudo  xargs -0 dos2unix

#Instalem el mpg123
sudo apt-get install mpg123

touch $HOME/Desktop/logs.txt
sudo chmod 755 /home/pi/Desktop/logs.txt
sudo systemctl restart apache2


