ifndef __newuser__
newuser_prereqs=
newuser_purge=
newuser_reqs=adduser

ifdef uid
.PHONY:
newuser: newuser-${uid}
else
.PHONY:
newuser:
	@echo "usage: make newuser uid='username' [args='[adduser args]]"
endif
	
newuser-%:
	@echo "usage: make newuser uid='username' [args='[adduser args]]'" 
	adduser ${args} $*
	passwd $*

.PHONY:
install-newuser: newuser-purge newuser-prereqs | newuser-reqs
.PHONY: newuser-purge newuser-prereqs newuser-reqs
newuser-purge: update | $(foreach v,${newuser_purge},purge-${v})
newuser-prereqs: update | $(foreach v,${newuser_prereqs}, add-${v})
newuser-reqs: update | $(foreach v,${newuser_reqs}, add-${v})
export __newuser__
endif
