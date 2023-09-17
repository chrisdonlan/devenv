include mk/newuser.mk
include mk/docker.mk

toplevel=$(shell git rev-parse --show-toplevel)
install:
	$(toplevel)/sh/install.sh
