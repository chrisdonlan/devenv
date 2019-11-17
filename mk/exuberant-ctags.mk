ifndef __exuberant_ctags__

.PHONY:
install-exuberant-ctags: .resources/dev/ctags-5.8/installed

.resources/dev/ctags-5.8.tar.gz:
	mkdir -p .resources/dev
	cd .resources/dev && \
		wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
	cd .resources/dev && \
		tar -xvf ctags-5.8.tar.gz

.resources/dev/ctags-5.8/installed: .resources/dev/ctags-5.8.tar.gz 
	cd .resources/dev/ctags-5.8 && \
		./configure && sudo make install
	touch .resources/dev/ctags-5.8/installed

clean-exuberant-ctags:
	cd .resources/dev/ctags-5.8 && \
		make uninstall
	rm -rf .resources/dev/ctags-5.8*

export __exuberant_ctags__=1
endif
