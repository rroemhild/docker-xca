FROM debian:7
MAINTAINER Rafael Römhild <rafael@roemhild.de>

ENV XCA_UID 1000
ENV XCA_GID 1000
ENV DISPLAY :0
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -qqy xca
RUN groupadd -g $XCA_GID xca \
    && useradd -u $XCA_UID -g $XCA_GID xca

USER xca
WORKDIR /home/xca
ENTRYPOINT ["/usr/bin/xca"]

