FROM debian:buster

# Install curl and apt-keyring deps
RUN apt-get update -qq \
  && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    curl \
    gnupg \
  && rm -rf /var/lib/apt/lists/*

# Install Google Cloud SDK keyring
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" \
   | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
  && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg \
   | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

# Install deps
RUN apt-get update -qq \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    bison \
    build-essential \
    file \
    flex \
    git \
    git-lfs \
    google-cloud-sdk \
    graphviz \
    less \
    libffi-dev \
    libreadline-dev \
    openssh-client \
    php \
    php-curl \
    pkg-config \
    procps \
    python3 \
    sudo \
    tcl-dev \
    vim \
    wget \
    xdot \
    zip \
  && apt-get autoclean && apt-get clean && apt-get -y autoremove \
  && rm -rf /var/lib/apt/lists/* \
  && update-alternatives --install /usr/bin/python python /usr/bin/python3.7 1

# Create a regular user
ARG UID=1000
ARG GID=1000
ARG USER=dev
ARG SHELL="/bin/bash"
ARG HOME="/home"

RUN /usr/sbin/groupadd -g ${GID} ${USER} \
  && /usr/sbin/useradd -l -u ${UID} -g ${GID} -s ${SHELL} -d ${HOME} ${USER} \
  && /usr/bin/install -d -m 0755 -o ${USER} -g ${USER} ${HOME} \
  # Add a mount point for repos and VS Code remote server
  && mkdir -p /var/vcs \
  && mkdir -p ${HOME}/.vscode-server \
  && chown ${UID}:${GID} /var/vcs ${HOME}/.vscode-server \
  && ln -sf /var/vcs/product ${HOME}/product \
  # Allow running Apt through sudo
  && echo "${USER} ALL = (root) NOPASSWD:/usr/bin/apt, /usr/bin/apt-get" > /etc/sudoers.d/${USER} \
  && chmod 0440 /etc/sudoers.d/${USER} \
  && visudo -c

USER ${UID}:${GID}

ENV USER ${USER}
ENV SHELL ${SHELL}
ENV HOME ${HOME}
ENV PATH $PATH:/var/vcs/arcanist/bin:/var/vcs/product/toolchain/bazel/latest

WORKDIR ${HOME}
ENTRYPOINT ["/bin/bash"]
