FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

# usage: nvidia-docker build --build-arg UID=`id -u` --build-arg USERNAME=`whoami` -t ${USER}/mlflow -f docker/Dockerfile .
# run usage: nvidia-docker run --rm -it -v `pwd`:/work -p 8005:8888 --name ${USER}.mlflow ${USER}/mlflow

# Basic setting library
RUN apt-get update \
  && apt-get install --yes --no-install-recommends \
    sudo \
    git \
    tig \
    cmake \
    pkg-config \
    unzip \
    wget \
    build-essential \
    libssl-dev\
    libbz2-dev\
    libreadline-dev \
    libsqlite3-dev \
    libffi-dev \
    curl \
    libsm6 \
    libgtk2.0-dev \
    vim \
    less \
    pv \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

# Make sudo user
ARG UID
ARG USERNAME
RUN useradd ${USERNAME} -u ${UID} -G sudo -s /bin/bash -m  && \
    echo ${USERNAME}' ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    chown ${USERNAME}:${USERNAME} /home/${USERNAME}

USER ${USERNAME}
WORKDIR /home/${USERNAME}
ENV HOME /home/${USERNAME}

# Install pyenv & install python
ENV PYTHON_VERSION 3.7.3
ENV PYENV_ROOT /home/${USERNAME}/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
RUN curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
RUN pyenv install ${PYTHON_VERSION} && pyenv global ${PYTHON_VERSION}

# Install python packages
COPY ./requirements.txt /tmp/requirements.txt
RUN pip install -U pip setuptools && \
    pip install -r /tmp/requirements.txt

WORKDIR /work
ENTRYPOINT ["/bin/bash"]
