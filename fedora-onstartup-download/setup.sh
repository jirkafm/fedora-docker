#!/bin/sh
dnf update -y

# Install handy system tools
dnf install -y net-tools telnet procps-ng bind-utils nmap rsync sudo passwd \
									 zip unzip p7zip xz wget curl coreutils less man sed gawk \
									 nmap-ncat which tar gzip openssl lz4 lsof util-linux-user \
									 findutils

#Install my stuff
dnf install -y tmux vim util-linux-user htop wget mc nethogs source-highlight \
									 zsh zsh-lovers git git-lfs openssh-server

# Clean cache.
dnf autoremove -y 
dnf clean all 
/usr/sbin/ldconfig

# Start SSH
ssh-keygen -f /etc/ssh/ssh_host_rsa_key     -N '' -t rsa
ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key   -N '' -t ecdsa
ssh-keygen -f /etc/ssh/ssh_host_ed25519_key -N '' -t ed25519
/usr/sbin/sshd &
