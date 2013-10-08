FROM ubuntu
MAINTAINER Zef Hemel <zef@zef.me>
# Install Docker inside of docker
RUN echo deb http://archive.ubuntu.com/ubuntu precise universe > /etc/apt/sources.list.d/universe.list
RUN apt-get update
RUN apt-get install -y iptables ca-certificates lxc openssh-server

# This will use the latest public release
#ADD https://get.docker.io/builds/Linux/x86_64/docker-latest /usr/bin/docker
# Or use a local one
ADD docker      /usr/bin/docker

# Ensure ending up in the home dir after logging in envs
RUN echo "cd" >> /etc/skel/.bashrc

ADD boot.sh     /usr/bin/boot.sh
ADD dshell      /usr/bin/dshell
ADD create-env  /usr/bin/create-env
ADD set-root-passwd /usr/bin/set-root-passwd

RUN chmod +x /usr/bin/dshell /usr/bin/create-env /usr/bin/docker /usr/bin/boot.sh /usr/bin/set-root-passwd

RUN mkdir -p /var/run/sshd
RUN echo "root:root" | chpasswd

VOLUME /data
EXPOSE 22
CMD boot.sh