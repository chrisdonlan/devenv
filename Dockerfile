from chrisdonlan/ops:debian-conda
ENV USEREMAIL="christopher.j.donlan@gmail.com"
ENV USERNAME="chrisdonlan"

SHELL [ "/bin/bash","-c"]

RUN apt-get update
RUN apt-get install -y git 
RUN apt-get install -y vim-nox
RUN apt-get install -y tmux
RUN apt-get install -y ctags
RUN apt-get install -y build-essential

ADD .bashrc /root/.
ADD .bashrc_appx /root/.
ADD .vimrc /root/.
ADD .tmux.conf /root/.

# TODO: do git with makes
USER root
WORKDIR /root
RUN git init
RUN git add .bashrc .vimrc .tmux.conf .bashrc_appx .bashrc_conda
RUN git config --global user.email "$USEREMAIL"
RUN git config --global user.name  "$USERNAME"
RUN git commit -m "(dev env) baseline config"

# TODO: do vundle with makes
# add vundle 
RUN mkdir -p /root/.vim/bundle
WORKDIR /root/.vim/bundle
RUN git submodule add https://github.com/vundlevim/Vundle.vim
RUN git submodule init
RUN git submodule update
RUN vim +PluginInstall +qall

# add makes
WORKDIR root
ADD mk /root/.
ADD makefile /root/
RUN make install

# TODO: do git with makes
# finalize with git 
WORKDIR /root
RUN git add mk/*
RUN git add makefile
RUN git commit -m "(dev env) builders"

WORKDIR /root
ENTRYPOINT /bin/bash && source .bashrc 
