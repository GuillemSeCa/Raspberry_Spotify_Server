#!/bin/bash
echo Content-Type: text/html
echo

echo -e "	<!DOCTYPE html><html>
		<body>
			<h1>FILTRAT PAQUETS</h1>
	    <h2>Veure tots els filtrats</h2>
	    
	    <h2>Filtrar (es poden deixar en blanc certes caselles)</h2
            <form action="filter.sh" method="get" ENCTYPE="text/plain">
			Name: <input type="text" name="prot" size="20">
			Source IP: <input type="text" name="src" size="20">
			Destiny IP: <input type="text" name="dest" size="20">
			Port: <input type="text" name="port" size="20">
			<input type="submit" value="Filtrar">
            </form>
	    </br>
            <form action="../webapp.sh">
                <input type="submit" value="Return">
            </form>
		</body>
		</html>"
