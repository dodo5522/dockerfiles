FROM jenkins/jenkins:2.263.1-lts-slim
MAINTAINER Takashi Ando <dodo5522@gmail.com>

ARG DEPENDENT_PACKAGES="\
    curl \
    handbrake-cli \
    lsdvd \
    vobcopy \
    ffmpeg \
    python3-pip \
    python3-jenkins \
    python3-lxml \
    python3-venv \
    python3"
ARG DEPENDENT_PLUGINS="\
    envinject:2.4.0 \
    job-import-plugin:3.4 \
    slack:2.45 \
    blueocean:1.24.3"

USER root
RUN apt-get update && apt-get install -y apt-transport-https \
       ca-certificates curl gnupg2 \
       software-properties-common
RUN apt-get install -y ${DEPENDENT_PACKAGES}
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/debian \
       $(lsb_release -cs) stable"
RUN apt-get update && apt-get install -y docker-ce-cli
RUN pip3 install git+https://github.com/dodo5522/auto_encoder.git@0.0.1

USER jenkins
RUN for PLUGIN in ${DEPENDENT_PLUGINS}; do \
        jenkins-plugin-cli --plugins ${PLUGIN}; \
    done

