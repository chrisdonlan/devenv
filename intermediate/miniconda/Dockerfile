FROM debian:latest

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

# prep
RUN apt-get update --fix-missing
RUN apt-get install -y bash
SHELL [ "/bin/bash","-c" ]

# dependencies
RUN apt-get install -y wget
RUN apt-get install -y bzip2
RUN apt-get install -y gzip
RUN apt-get install -y ca-certificates
RUN apt-get install -y curl
RUN apt-get install -y git

# cleanup
RUN apt-get clean 
RUN rm -rf /var/lib/apt/lists/*

# anaconda
ENV MINICONDA_VERS=latest
RUN touch ~/.bashrc_conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-${MINICONDA_VERS}-Linux-`arch`.sh -O ~/miniconda.sh 
RUN /bin/bash ~/miniconda.sh -b -p /opt/conda
RUN rm ~/miniconda.sh
RUN /opt/conda/bin/conda clean -tipsy
RUN ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh
RUN echo ". /opt/conda/etc/profile.d/conda.sh" > ~/.bashrc_conda
RUN echo "conda activate base" >> ~/.bashrc_conda

ENTRYPOINT /bin/bash
