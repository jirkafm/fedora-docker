# Dockerfile for my dynamic base Fedora. Downloads stuff
# when contnainer is run to achieve all latests pkgs from
# repo.
#
# Inspired by and some stuff taken from https://github.com/hiroom2/doxrdp
#
FROM fedora:latest
MAINTAINER Jiri Kaplan <jiri.kaplan@email.cz>
LABEL \
Description="Basic Fedora environment" \
Version="1.0"
EXPOSE 22

# systemd env
ENV container docker

COPY setup.sh /tmp/

CMD /tmp/setup.sh  && /bin/zsh
