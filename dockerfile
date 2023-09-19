# For M1 Mac
FROM --platform=linux/amd64 ubuntu:latest

# update
RUN apt-get -y update && apt-get install -y \
libsm6 \
libxext6 \
libxrender-dev \
libglib2.0-0 \
sudo \
wget \
unzip \
vim

#install miniconda3
WORKDIR /opt

# download miniconda package and install miniconda
# archive -> https://docs.conda.io/en/latest/miniconda.html
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash /opt/Miniconda3-latest-Linux-x86_64.sh -b -p /opt/miniconda3
RUN rm -f Miniconda3-latest-Linux-x86_64.sh
# set path
ENV PATH /opt/miniconda3/bin:$PATH

# conda create
RUN conda create -n pymol python=3.9

# install conda package
SHELL ["conda", "run", "-n", "pymol", "/bin/bash", "-c"]

RUN command conda config --append channels conda-forge
RUN conda install -c conda-forge rdkit -y
# RUN conda install -c conda-forge pymol-open-source -y
RUN conda install plotly
RUN conda install -c conda-forge nodejs jupyterlab
# RUN conda install -c conda-forge py3dmol

WORKDIR /
RUN mkdir /work
WORKDIR /work

RUN conda init

RUN pip install streamlit
EXPOSE 8501
