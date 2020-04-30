# Dockerfile for my-env Fedora container.
#
# Inspired by and some stuff taken from https://github.com/hiroom2/doxrdp
#
FROM jirkafm:fedora-base
MAINTAINER Jiri Kaplan <jiri.kaplan@email.cz>
LABEL \
Description="Fedora environment for testing my-env" \
Version="1.0"

ENV USERNAME jirkafm
ENV PASSWORD changeit

COPY setup-env.sh /tmp

CMD \ 
sh /tmp/setup-env.sh $USERNAME $PASSWORD && echo "Enjoy my shell@fedora setup $USERNAME!" && su - $USERNAME
