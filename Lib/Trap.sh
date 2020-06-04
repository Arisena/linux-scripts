if [ "${BASH_SOURCE[0]}" -ef "$0" ]; then
    echo "Source this script, don't execute it"
    exit 1
fi

redo() {
	clear
	sleep .1
	printf "Fatal Error Occured\n"
	sleep .5
	printf "Recovering"
	for i in {1..5}
	do
		sleep .6
		printf "."
	done
	sleep .6
	printf "\n"
	printf '%s%s%s%s' "$(tput setaf 2)" "$(tput blink)" "Press enter to restart" "$(tput sgr0)"
	read
	kill $0 2> /dev/null
	exec $0
}

function ctrl_c() {
	echo
	echo "SIGINT RECEIVED"
	echo "EXITING PROGRAM"
	exit 1
}
trap ctrl_c sigint
function ctrl_z() {
	echo
	echo "Sleep not supported"
	sleep 1
	for i in {1..5}
	do
		printf "ERROR"
		sleep .1
	done
	printf "FATAL"
	sleep .2
	redo
}
trap ctrl_z sigtstp
