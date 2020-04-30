# fedora-docker
My Fedora docker images repo contains bunch of hierarchically dependent Dockerfiles and scripts.

If user do not set environment variable USERNAME and PASSWORD containers will be run under **jirkafm** user with **changeit** password.
See setup scripts for details.

*Please note that nature of following scripts are rather dynamic and usually may not reflect exactly intended docker container usage philosophy.*

## List of Dockerfiles 

#### fedora-base
Enhanced fedora:latest image with addition of my essential packages. Serves as a **base image** for other docker images.
```
docker run --rm -it jirkafm:fedora
```

#### fedora-onstartup-download
Similar to [fedora-base](#fedora-base) but it downloads essential packages when container is run. It also generates ssh keys and runs sshd in background.
```
docker run --rm -p2222:22 -it jirkafm:fedora-onstartup-download
```

#### fedora-myenv
I use this image to test changes in my environemnt. It will create a user with my shell configuration taken from https://github.com/jirkafm/my-env.

```
docker run --rm -e USERNAME='john' -e PASSWORD='doe' -it jirkafm:fedora-myenv
```

### fedora-vnc
[fedora-myenv](#fedora-myenv) based docker container with running vnc server. [JWM](https://joewing.net/projects/jwm/) is preinstalled to handle basic gui desktop. Vnc server can be customized through environment variable **VNC_OPTIONS**. Installation is **dynamic** therefore you should wait couple of minutes before connecting with favorite vnc viewer.

You may check that vnc server is running with **docker logs \<container-id>**. Similar message should appear when vnc server is running:
```
New 'a65712a50bc4:1 (jirkafm)' desktop is a65712a50bc4:1
```
To run fedora-vnc container locally on port 5900 execute following statement:

```
docker run --rm -e VNC_OPTIONS='-geometry 1920x1080' -t -d -p127.0.0.1:5900:5900 jirkafm:fedora-vnc
```

### fedora-mate
[fedora-myenv](#fedora-myenv) based docker container with running vnc server. The only difference between [fedora-vnc](#fedora-vnc) and [fedora-mate](#fedora-mate) is that instead of [JWM](https://joewing.net/projects/jwm/) is used [MATE](https://mate-desktop.org/). Same rules about initialization of vnc server applies for fedora-mate too!

```
docker run --rm -e VNC_OPTIONS='-geometry 1920x1080' -t -d -p127.0.0.1:5900:5900 jirkafm:fedora-mate

```

### fedora-mate-onstartup
Similar to [fedora-mate](#fedora-mate) but everything is installed when container is run therefore expect much longer initialization time as all packages needs to be downloaded first. Benefit of it is up to date MATE and small image.

```
docker run --rm -e VNC_OPTIONS='-geometry 1920x1080' -t -d -p127.0.0.1:5900:5900 jirkafm:fedora-mate-onstartup

```
## Building docker images
I usually descent to desired directory and then run following statement:
```
docker build --no-cache -t $(git config user.name):$(basename $PWD) .
```

It will create image tagged with my username and current directory name. Parameter **--no-cache** is optional.
