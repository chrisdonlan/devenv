#!/bin/bash
errorMsg(){
	# $1: message
	# [$2: optional usage statement]
	echo "Error: $1" > /dev/stderr
	if [ -n "$2" ]; then
		echo "usage: ${FUNCNAME[1]} $2" > /dev/stderr
	fi
}
getpkg(){
	# $1: item to install
	if [ -z "$1" ]; then 
		errorMsg "bad argument" "<pkg-to-install> ..."
		exit 1
	fi
	sudo apt-get install -y $@
}
getcmd() {
	# $1: cmd 
	# [$2: package]
	if command -v $1 > /dev/null; then
		exit 0
	fi

	pkg=$( ( [[ -n "$2" ]] && echo "$2" ) || echo "$1" )
	getpkg $pkg
}
getpkg universal-ctags vim tmux
