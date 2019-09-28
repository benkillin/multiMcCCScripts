#!/bin/bash

# this timeout is to ensure the mojang authentication servers don't temporarily 
# blacklist your IP for logging in too many alts at once:
timeout=15; 


for folder in *; do 
	if [ -d "$folder" ]; then
		
		cd $folder;
		pwd;
		
		screen -L -Logfile ../$folder.screenout -dmS "$folder" mono MinecraftClient.exe
		# NOTE: if your version of screen breaks because of the -L and -Logfile flags, use this instead:
		#screen -dmS "$folder" mono MinecraftClient.exe

		sleep 5;
		
		if screen -list | grep $folder ; then 
			#if grep "" ../$folder.screenout ; then
				echo "[+] Good to go on $folder!";
				sleep $timeout;
			#else
			#	cat ../$folder.screenout;
			#	printf "\n\n[-] The console client's bein a lil' bish, check it out.\n\n";
			#	exit 1;
			#fi;
		else 
			cat ../$folder.screenout;
			printf "\n\n[-] Screen must have died - what you gonna do about it, little bitch?\n\n";
			exit 1;
		fi;

		cd ..;
	fi;
done;


exit 0;

