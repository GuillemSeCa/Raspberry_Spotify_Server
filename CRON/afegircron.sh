#!/bin/bash
echo Content-Type: text/html
echo 
#@TODO

aux1=`echo $QUERY_STRING | awk -F= '{print $2}'`
cron=`echo $aux1 | awk -F\& '{print $1}'`

sudo touch $HOME/mycron.txt
sudo chmod 777 $HOME/mycron.txt

#write out current crontab
crontab -l > $HOME/mycron.txt
#echo new cron into cron file
echo '\n$cron' >> $HOME/mycron.txt
#install new cron file
sudo crontab $HOME/mycron.txt

echo -e '	<!DOCTYPE html><html>
		<body>
			<h1>AFEGIR CRON</h1>
			<p>Cron afegit.</p>

            <form action="../webapp.sh">
                <input type="submit" value="Return">
            </form>
		</body>
		</html>'
