#!/bin/bash
USERNAME=$1
PASSWORD=$2

if [ -z $USERNAME ]; then
	USERNAME=jirkafm
fi

if [ -z $PASSWORD ]; then
	PASSWORD=changeit
fi

# NOPAASWD for wheel 
sed -e 's/%wheel\(.*\)/#%wheel\1/g' \
	  -e 's/#.*%wheel\(.*\)NOPASSWD\(.*\)/%wheel\1NOPASSWD\2/g' \
		-i /etc/sudoers

# Create user
useradd -m $USERNAME -s /bin/zsh
gpasswd -a $USERNAME wheel
echo $USERNAME:$PASSWORD  | chpasswd

# Setup env
ENV_SETUP_DIR=/home/$USERNAME/.jirkafm/fedora-setup

su - $USERNAME -c "git clone https://github.com/jirkafm/fedora-setup $ENV_SETUP_DIR"
sed -ie 's/OVERWRITE=N/OVERWRITE=Y/' $ENV_SETUP_DIR/scripts/env.sh

su - $USERNAME -c "export CHSH=no && export RUNZSH=no && cd $ENV_SETUP_DIR && ./control.sh zshell"
su - $USERNAME -c "cd $ENV_SETUP_DIR && ./control.sh env"
