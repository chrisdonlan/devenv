include mk/newuser.mk
include mk/docker.mk

toplevel=$(shell git rev-parse --show-toplevel)
install:
	$(toplevel)/sh/install.sh

.FORCE:

.PHONY:
re-tag: .FORCE
	ctags -R --exclude=*-venv/ --python-kinds=-i .
	rm ~/tags && ln tags ~/tags

tags: $(SOURCES)
	rm ~/tags
	ctags --append --exclude=*-venv/ --python-kinds=-i $?
	rm ~/tags && ln tags ~/tags
