FROM kalilinux/kali-rolling:latest

ENV NAME=kali-toolbox VERSION=rolling
LABEL com.github.containers.toolbox="true" \
    com.github.debarshiray.toolbox="true" \  
    name="$NAME" \
    version="$VERSION" \
    usage="This image is meant to be used with the toolbox command" \
    maintainer="Mihkal Dunfjeld <mihkal@dunfjeld.no>"


ENV DEBIAN_FRONTEND noninteractive

COPY extra-packages /
RUN apt update
RUN apt install -y $(cat extra-packages)
RUN apt upgrade -y
RUN rm /extra-packages

RUN echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/toolbox
#RUN apt-get install -y pciutils hcxdumptool hcxtools

RUN apt-get update && apt install -y kali-linux-headless
#CMD /bin/zsh
RUN apt clean

RUN sed -i 's/# nb_NO.UTF-8 UTF-8/nb_NO.UTF-8 UTF-8/g' /etc/locale.gen && locale-gen
