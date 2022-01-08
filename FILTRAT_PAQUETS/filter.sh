#!/bin/bash

echo Content-Type: text/html
echo
echo -e "<!DOCTYPE html><html><body>"

aux1=`echo $QUERY_STRING | awk -F= '{print $2}'`
prot=`echo $aux1 | awk -F\& '{print $1}'`
aux2=`echo $QUERY_STRING  | awk -F\& '{print $2}'`
src=`echo $aux2  | awk -F\= '{print $2}'`
aux3=`echo $QUERY_STRING | awk -F\& '{print $3}'`
dest=`echo $aux3 | awk -F\= '{print $2}'`
port=`echo $QUERY_STRING | awk -F\= '{print $5}'`

if [ -z "$prot" ];
then
	protT="-p $prot"
else
	protT=""
fi

if [ -z "$src" ];
then
	srcT="-s $src"
else
	srcT=""
fi

if [ -z "$dest" ];
then
	destT="-d $dest"
else
	destT=""
fi

if [ -z "$port" ];
then
	portT="--dport $port"
else
	portT=""
fi

iptable="$(protT) $(srcT) $(destT) $(portT)"



echo -e "	<h1>IPTABLE added</h1>
  <p>Protocol: $prot</p>
  <p>Source IP: $src</p>
  <p>Destiny IP: $dest</p>
  <p>Port: $port</p>
  <p>$iptable</p>
    <form action="../webapp.sh">
					<input type="submit" value="Return">
		</form>"
echo -e "</body></html>"
