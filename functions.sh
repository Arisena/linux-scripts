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
