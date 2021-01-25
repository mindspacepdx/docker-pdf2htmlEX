# docker-pdf2htmlEX
OS: debian:buster-slim

Poppler: 0.89.0

pdf2htmlEX: 0.18.8.rc1

This docker image builds the pdf2htmlEX project (https://github.com/pdf2htmlEX/). It also creates a .deb file so other's can reference that file.

Example Usage:
```
COPY --from=mindspacephx/docker-pdf2htmlex:1.0.0 /pdf2htmlEX/imageBuild/pdf2htmlEX-0.18.8*.deb /pdf2htmlex.deb
   
RUN apt-get update  \
&& apt-get install -yq libglib2.0-0 libfreetype6 libfontconfig1 libcairo2 libpng16-16 libjpeg62-turbo\
&& rm -rf /var/lib/apt/lists/*
   
RUN dpkg -i ./pdf2htmlex.deb
```