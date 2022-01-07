#!/bin/bash

echo Content-Type: text/html
echo
echo -e "<!DOCTYPE html><html><body>"

aux1=`echo $QUERY_STRING | awk -F= '{print $2}'`
name=`echo $aux1 | awk -F\& '{print $1}'`
password=`echo $QUERY_STRING | awk -F\= '{print $3}'`
pass2=$(sudo grep -w $name /etc/shadow | cut -d: -f2 2>&1)

if [ `id -u $name 2>/dev/null || echo -1` -ge 0 ];
then
	if [ "$password" = "$pass2" ];
	then
		echo "SYS_LOGS: Usuari $name ha fet login al sistema." >> /home/pi/Desktop/logs.txt
		echo -e "	<h1>LOGIN OK</h1>
					<p>LOGIN successful</p>
					<form action="../webapp.sh">
						<input type="submit" value="Continue">
					</form>"
	else
		echo "SYS_LOGS: Intent de login al sistema amb nom: $name. Contrasenya fallida." >> /home/pi/Desktop/logs.txt
		echo -e "	<h1>LOGIN FAILED</h1>
					<p>Doesn't match password.</p>
					<form action="../index.sh">
						<input type="submit" value="Return">
					</form>"
	fi
else
	echo "SYS_LOGS: Intent de login al sistema amb nom: $name. Usuari no registrat." >> /home/pi/Desktop/logs.txt
	echo -e "	<h1>LOGIN FAILED</h1>
				<p>User doesn't exist.</p>
				<form action="../index.sh">
					<input type="submit" value="Return">
				</form>"
fi
echo -e "</body></html>"
