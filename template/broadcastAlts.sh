#!/bin/bash

# usage: ./broadcastAlts "message or command to send to the console client^m"
# NOTE: It is REQUIRED to put exactly "^m" at the end or else the enter key 
# will not be pressed inside the screen session to send the command to the console client.

for folder in *; do
	if [ -d "$folder" ]; then
		screen -S $folder -p 0 -X stuff "$1"
	fi;
done;
