# Dockerfile for my Fedora vnc container.
#
# Inspired by and some stuff taken from https://github.com/hiroom2/doxrdp
#
FROM jirkafm:fedora-myenv
MAINTAINER Jiri Kaplan <jiri.kaplan@email.cz>
LABEL \
Description="Fedora environment for testing with vnc" \
Version="1.0"

EXPOSE 5900

COPY setup-vnc.sh /tmp/
COPY xstartup /tmp/

CMD /tmp/setup-env.sh $USERNAME $PASSWORD && /tmp/setup-vnc.sh $USERNAME $PASSWORD && su - $USERNAME
