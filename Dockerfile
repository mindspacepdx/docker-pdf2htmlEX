FROM debian:buster-slim

RUN echo "deb http://ftp.us.debian.org/debian sid main" > /etc/apt/sources.list \
&& apt-get update \
&& apt-get -y install \
    git \
    sudo \
&& git clone https://github.com/pdf2htmlEX/pdf2htmlEX.git \
&& cd /pdf2htmlEX \
&& git checkout tags/0.18.8.rc1 \
&& git config --global user.name "Fathom Devops" \
&& git config --global user.email "support@mindspace.net" \
&& mkdir -p /usr/share/man/man1 \
&& echo "0.18.8rc1" | buildScripts/buildInstallLocallyApt \
&& ln -s /usr/bin/python3 /usr/bin/python

COPY ./createDebianPackage /pdf2htmlEX/buildScripts/

RUN cd /pdf2htmlEX \
&& chmod +x ./buildScripts/createDebianPackage \
&& ./buildScripts/createDebianPackage