FROM ubuntu:22.04
RUN apt-get -y update && apt-get -y install build-essential rsync flex bison linux-generic elfutils openssl perl diffutils coreutils python3 gawk grep
#RUN apt-get -y update && apt-get -y install build-essential rsync flex bison linux-generic elfutils-dev libressl-dev perl diffutils coreutils python3 gawk grep
WORKDIR /project

