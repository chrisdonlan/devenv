include mk/newuser.mk
include mk/docker.mk
include mk/exuberant-ctags.mk
# install-docker manually
install: install-newuser install-exuberant-ctags

# TODO: handle docker creation with make for make-esque sensitivity to file
# changes
