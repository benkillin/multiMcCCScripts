# multiMcCCScripts

This project is a set of shell scripts to manage running multiple minecraft console client instances on a linux VPS.

For this to work you must install the mono project to run .net apps on linux, and you must install the complete package.

## Usage

### 0) Download the Minecraft Console Client following the directions on the [creator's github](https://github.com/ORelio/Minecraft-Console-Client/releases).

Place the .exe in `./template/consoleClient/`

Ensure it is named "MinecraftClient.exe"

### 1) edit `list.txt` and input the information for your alts you want to run as console clients. 

The format is as follows:

```
account1@example.com:password1:alt_IGN1
account2@example.com:password2:alt_IGN2
```

So, you would input the email address for the account before the first colon, then the password before the second colon, and then the alt's in game name after the second colon. If your password has a colon in it, change it or update `init.sh` to use a different separator for the awk portion where it is extracting these 3 fields.

### 2) Edit `MinecraftClient.ini` to have the settings you want
**Pay attention specifically to the server IP address, and the antiAFK and remoteControl settings.**

**Leave the username and password as they are, those are known placeholder values that will be replaced when `init.sh` is executed.**

### 3) run `./init.sh` 

The `active` directory will be populated with instances of the template updated for each of the alts listed in `list.txt`

### 4) go into the `active` directory and run `./start.sh`

```
cd active
./start.sh
```

### 5) Wait for each alt to log in and if you configured antiAFK to constantly run the command to connect to a specific server in a server that has a hub realm, wait for that to trigger for the alt to be logged into the server.

## Troubleshooting

If something goes wrong check the logs of the screen sessions, which will be created after `./start.sh` is executed and named after the folder name in the `active` directory with the extension `.screenout` 

If the `./start` script fails to start a screen session, open the script and read the note I put in there saying that some versions of screen do not support the screen logging flags that are specified by default. Try commenting the default line and uncommenting the line noted by the comment.

## Helper scripts

There are 2 helper scripts in the `active` directory after `init.sh` has run that will help you manage the clients while they are logged in.

1) `loopAlts.sh`

This script will allow you to attach to the screen session, one at a time, for you to do whatever you need to from the minecraft console client terminal. 

Once you are done typing messages or commands hit `ctrl + a` and then `d` to detach and go to the next screen session.

2) `broadcastAlts.sh`

This script will allow you to send input to all of the screen sessions at the same time. the usage is:

`./broadcastAlts.sh "your commands or text here^m"

**note: the "^m" is REQUIRED to be entered as a carrot (shift + 6 on a qwerty keyboard layout) and the letter `m`. This is the signal to the screen session to actually send the input to the running console client terminal.**

