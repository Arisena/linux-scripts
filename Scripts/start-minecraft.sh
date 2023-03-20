#!/bin/bash

#List all running Java processes, if one exists it will fill the variable
#Will need to put more than just "java" if multiple servers are running
#						ex: "java -Xmx6G -Xmx6G -jar forge-1.16.5-36.2.39.jar nogui?"
#						Or whatever the specific MC server command is
running=$(ps -ef | grep "java" | grep -v grep)

#Send Email using msmtp when the server starts (Optional)
#msmtp will need a seperate setup if you wish to use
function send_email() {
  local recipient="$1"
  local subject="$2"
  local message="$3"

  cat <<EOF | msmtp -a default "$recipient"
To: $recipient
Subject: $subject $(date +"%Y-%m-%d %H:%M")

$message

System Information:
$(uname -a)

Please give this to anyone who you would like to join the server:
$(hostname --fqdn)


Best regards,
Auto-Mailer @atswarra.com
EOF
}

#Create a TMUX session called Minecraft if one doesn't exist
if tmux list-sessions | grep -q "Minecraft"; then
	echo "session exists"
else
	tmux new-session -d -s Minecraft
fi

#Check if the variable "Running" is empty
#If it is, send keys into TMUX session to start the MC Server
#Else ; Exit
if [[ -z $running ]]; then
	tmux send-keys -t Minecraft "cd /home/ari/minecraft" ENTER
	#Will need to rename 'start.sh' to whatever script you use to start the MC Server
	tmux send-keys -t Minecraft ./start.sh ENTER
	#Comment out the line below if you do not wish to use email
	send_email email@example.com "Minecraft Server Started" "The Minecraft Server has begun it's startup sequence"
else
	exit 0
fi
