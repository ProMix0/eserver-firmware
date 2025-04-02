FROM alpine:3.18
RUN apk add --no-cache build-base rsync flex bison linux-headers elfutils-dev libressl-dev perl diffutils coreutils python3 gawk grep
WORKDIR /project

