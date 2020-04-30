#!/bin/bash
USERNAME=$1
PASSWORD=$2
VNC_OPTIONS=$VNC_OPTIONS

if [ -z $USERNAME ]; then
	USERNAME="jirkafm"
fi

if [ -z $PASSWORD ]; then
	PASSWORD="changeit"
fi

if [ -z $VNC_OPTIONS ]; then
	VNC_OPTIONS="-geometry 1280x800"
fi

# Setup env
ENV_SETUP_DIR=/home/$USERNAME/.jirkafm/fedora-setup

su - $USERNAME -c "cd $ENV_SETUP_DIR && ./control.sh services"

dnf install -y jwm fedora-logos
sed -i 's/jwm-blue/\/usr\/share\/icons\/hicolor\/16x16\/apps\/fedora-logo-icon.png/' /etc/system.jwmrc

su - $USERNAME -c "echo 'mode: off\n' > /home/${USERNAME}/.xscreensaver"
printf "$PASSWORD\n$PASSWORD\n\n" | vncpasswd
mkdir -p /home/$USERNAME/.vnc
mv /root/.vnc/passwd /home/$USERNAME/.vnc/
mv /tmp/xstartup /home/$USERNAME/.vnc/
chown -R $USERNAME:$USERNAME /home/$USERNAME/.vnc
su - $USERNAME -c "vncserver -rfbport 5900 $VNC_OPTIONS &" 
