include newuser.mk
include docker.mk
include exuberant-ctags.mk
# install-docker manually
install: install-newuser install-exuberant-ctags
