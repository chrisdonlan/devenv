include mk/newuser.mk
include mk/docker.mk

toplevel=$(shell git rev-parse --show-toplevel)
install:
	$(toplevel)/sh/install.sh

.FORCE:

.PHONY:
re-tag: .FORCE
	ctags -R --exclude="*-venv/*" --exclude="venv/*" --python-kinds=-i .
	ln -f tags ~/tags

tags: $(SOURCES)
	rm ~/tags
	ctags --append --exclude="*-venv/*" --exclude="venv/*" --python-kinds=-i $?
	ln -f tags ~/tags
