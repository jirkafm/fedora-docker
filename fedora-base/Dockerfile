# Dockerfile for my base Fedora containers.
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

# Update
RUN dnf update -y

# Install handy system tools
RUN dnf install -y net-tools telnet procps-ng bind-utils nmap rsync sudo passwd \
									 zip unzip p7zip xz wget curl coreutils less man sed gawk \
									 nmap-ncat which tar gzip openssl lz4 lsof util-linux-user \
									 findutils


#Install my stuff
RUN dnf install -y tmux vim util-linux-user htop wget mc nethogs source-highlight \
									 zsh zsh-lovers git git-lfs openssh-server

# Clean cache.
RUN \
dnf autoremove -y && \
dnf clean all && \
/usr/sbin/ldconfig
