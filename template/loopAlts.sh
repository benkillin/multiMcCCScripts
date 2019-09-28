#!/bin/bash

# this script lets you attach to each screen session, one at a time, to do whatever you need.
# use the screen command ctrl+a, d to detach and move to the next session.

for folder in *; do
	if [ -d "$folder" ]; then
		screen -r $folder
		sleep 1;
	fi;
done;
