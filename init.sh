#!/bin/bash

# this script initializes the alts in the active directory by copying the template in for each alt
# and then changing the template username/email and password to what is set in list.txt

rm -r active;
mkdir active;
counter=1; 

for player in `cat list.txt`; do
	date;

	email=`echo $player | awk -F : '{print $1;}'`;
	pw=`echo $player | awk -F : '{print $2;}'`;
	nick=`echo $player | awk -F : '{print $3;}'`;

	echo $counter $email $pw;

	cp template/kickmessages.txt ./active/
	cp template/*.sh ./active/
	cp -a template/consoleClient ./active/$counter$nick;
	sed -i "s/login=email@email.email/login=$email/g" ./active/$counter$nick/MinecraftClient.ini;
	sed -i "s/password=hunter2/password=$pw/g" ./active/$counter$nick/MinecraftClient.ini;
	head -4 ./active/$counter$nick/MinecraftClient.ini;

	((counter++)); 
	printf "\n\n";
done;
