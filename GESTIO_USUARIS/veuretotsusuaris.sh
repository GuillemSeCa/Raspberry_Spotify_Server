#!/bin/bash
echo Content-Type: text/html
echo

users=`echo "$(cut -d: -f1 /etc/passwd)"`

echo -e "	<!DOCTYPE html><html>
		<body>
			<h1>SHOW ALL USERS</h1>"
		echo "SYS_LOGS: S'han mostrat tots els usuaris del sistema." >> $HOME/logs.txt
			while IFS="" read -r -a line;
			do
				echo "<p>$line</p>";
			done <<< "$users"

echo -e "	<form action="../webapp.sh">
                <input type="submit" value="Return">
            </form>
		</body>
		</html>"
