#!/bin/bash
echo Content-Type: text/html
echo

#@TODO

aux1=`echo $QUERY_STRING | awk -F= '{print $2}'`
cron=`echo $aux1 | awk -F\& '{print $1}'`


#write out current crontab
crontab -l > ./mycron.txt
#echo new cron into cron file
echo "$cron" >> ./mycron.txt
#install new cron file
crontab ./mycron.txt
rm ./mycron.txt


echo -e "	<!DOCTYPE html><html>
		<body>
			<h1>AFEGIR CRON</h1>
			<p>Cron afegit.</p>

            <form action="../webapp.sh">
                <input type="submit" value="Return">
            </form>
		</body>
		</html>"
