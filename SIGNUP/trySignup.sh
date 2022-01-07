#!/bin/bash

echo "Content-Type: text/html"
echo ""
echo -e "<!DOCTYPE html><html><body>"

aux1=`echo $QUERY_STRING | awk -F= '{print $2}'`
name=`echo $aux1 | awk -F\& '{print $1}'`
password=`echo $QUERY_STRING | awk -F\= '{print $3}'`
try=$(sudo useradd -m $name -p $password 2>&1)

if [ -z $try ];
then
	echo "SYS_LOGS: S'ha fet un signup correcte al sistema." >> /home/pi/Desktop/logs.txt
	echo -e "	<h1>SIGNUP OK</h1>
				<p>Signup successful</p>
				<form action="../index.sh">
					<input type="submit" value="Return">
				</form>"
else
	echo "SYS_LOGS: S'ha fet un signup incorrecte al sistema." >> /home/pi/Desktop/logs.txt
	echo -e "	<h1>SIGNUP FAILED</h1>
				<p>$try</p>
				<form action="../index.sh">
					<input type="submit" value="Return">
				</form>"
fi
echo -e "</body></html>"
