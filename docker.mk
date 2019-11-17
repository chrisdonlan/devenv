ifndef __docker__
include apt.mk
docker_purge=docker docker-engine docker.io containerd runc
docker_prereqs=apt-transport-https ca-certificates curl gnupg2 software-properties-common
docker_reqs=docker-ce docker-ce-cli containerd.io


.PHONY:
install-docker: docker-purge docker-prereqs | docker-reqs
	sudo docker run hello-world
	make activate-docker

.PHONY: docker-purge docker-prereqs docker-reqs
docker-purge: update | $(foreach v,${docker_purge},purge-${v})
docker-prereqs: update | $(foreach v,${docker_prereqs}, add-${v})
	curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
	sudo apt-key fingerprint 0EBFCD88
	sudo add-apt-repository  "deb [arch=amd64] https://download.docker.com/linux/debian $(shell lsb_release -cs) stable"
docker-reqs: update | $(foreach v,${docker_reqs}, add-${v})
	sudo groupadd docker
	sudo usermod -aG docker $$USER
	newgrp docker
export __docker__=1
endif
