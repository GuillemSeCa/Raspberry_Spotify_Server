#!/bin/bash
echo Content-Type: text/html
echo
echo "SYS_LOGS: S'ha apagat el sistema." >> $HOME/logs.txt
echo -e "	<!DOCTYPE html><html>
		<body>
			<p>Apagando...</p>

            <form action="../index.sh">
                <input type="submit" value="Return">
            </form>
		</body>
		</html>"

sudo shutdown now
