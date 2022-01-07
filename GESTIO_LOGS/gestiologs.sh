#!/bin/bash
echo Content-Type: text/html
echo
echo -e "	<!DOCTYPE html><html>
		<body>
			<h1>GESTIO DE LOGS</h1>"
			
		while IFS="" read -r -a line;
		do
			echo "<p>$line</p>";
		done <<< "$(sudo cat "$HOME/logs.txt")"
echo -e "   <form action="../webapp.sh">
                <input type="submit" value="Return">
            </form>
		</body>
		</html>"
