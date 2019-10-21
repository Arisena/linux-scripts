if [ "${BASH_SOURCE[0]}" -ef "$0" ]
then
    echo "Hey, you should source this script, not execute it!"
    exit 1
fi

redo() {
	clear
	printf "Sleep Not Supported\n"
	printf "Press Enter to restart"
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
	redo
}
trap ctrl_z sigtstp
