#!/bin/bash

echo Content-Type: text/html
echo
echo -e "<!DOCTYPE html><html><body>"

aux1=`echo $QUERY_STRING | awk -F= '{print $2}'`
prot=`echo $aux1 | awk -F\& '{print $1}'`
aux2=`echo $QUERY_STRING | awk -F\= '{print $3}'`
src=`echo $aux2 | awk -F\& '{print $3}'`
dest=`echo $QUERY_STRING | awk -F\= '{print $4}'`
port=`echo $QUERY_STRING | awk -F\= '{print $5}'`

echo -e "	<h1>IPTABLE added</h1>
  <p>$prot</p>
  <p>$src</p>
  <p>$dest</p>
  <p>$port</p>
    <form action="../webapp.sh">
					<input type="submit" value="Return">
		</form>"
echo -e "</body></html>"
