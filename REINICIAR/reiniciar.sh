#!/bin/bash
echo Content-Type: text/html
echo
echo "SYS_LOGS: S'ha reiniciat el sistema." >> $HOME/logs.txt
echo -e "	<!DOCTYPE html><html>
		<body>
			<p>Reiniciando...</p>

            <form action="../index.sh">
                <input type="submit" value="Return">
            </form>
		</body>
		</html>"

sudo reboot
