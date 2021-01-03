FROM jenkins/jenkins:2.263.1-lts-slim
LABEL version 1.0

ARG DEPENDENT_PACKAGES=\
    python-jenkins \
    python-lxml \
    python3-venv \
    handbrake-cli \
    lsdvd \
    vobcopy \
    vlc \
    libdvdcss-dev \
    libdvdcss2

USER root
RUN apt-get update && apt-get install -y apt-transport-https \
       ca-certificates curl gnupg2 \
       software-properties-common \
       ${DEPENDENT_PACKAGES}
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/debian \
       $(lsb_release -cs) stable"
RUN apt-get update && apt-get install -y docker-ce-cli

USER jenkins
RUN jenkins-plugin-cli --plugins blueocean:1.24.3

