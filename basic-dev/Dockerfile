FROM ubuntu
RUN echo deb http://archive.ubuntu.com/ubuntu precise universe > /etc/apt/sources.list.d/universe.list
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y curl build-essential vim nano git-core mercurial