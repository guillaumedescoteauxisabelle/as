doathing() {
	echo "All: $@"
	echo "---------"
	shift 1
	echo "shifted: $@"
}

doathing allo a toi 22
