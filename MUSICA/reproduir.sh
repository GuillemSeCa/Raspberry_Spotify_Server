#!/bin/bash
mpg123 -R --fifo /home/pi/Downloads/pipe
sudo chmod 777 /home/pi/Downloads/pipe

while true
do
    for i in 1 2 3 4
    do
        echo "LOADLIST $i /home/pi/Downloads/playlist3.m3u" > /home/pi/Downloads/pipe
        sleep 60
    done
done
