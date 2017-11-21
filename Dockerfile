FROM ubuntu:16.04
LABEL Louis Paret <perso@louisparet.fr>

## Install packages
RUN apt-get update \
  && apt-get -y install \
    software-properties-common \
  && add-apt-repository -y ppa:webupd8team/java \
  && apt-get update \
  && echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections \
  && apt-get install -y oracle-java8-installer \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ADD Dockerfile /Dockerfile