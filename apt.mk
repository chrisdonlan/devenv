ifndef __apt__
.PHONY:
update:
	sudo apt-get update
add-%:
	sudo apt-get install $*
purge-%:
	-sudo apt-get remove $*
export __apt__=1
endif
