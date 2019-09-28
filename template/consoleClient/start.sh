#!/bin/sh


export folder=${PWD##*/}
echo starting $folder...
screen -L -Logfile ../$folder.screenout -dmS "$folder" mono MinecraftClient.exe
