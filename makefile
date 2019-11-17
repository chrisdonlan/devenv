include mk/newuser.mk
include mk/docker.mk
include mk/exuberant-ctags.mk
# install-docker manually
install: install-newuser install-exuberant-ctags
