# docker-pdf2htmlEX
OS: debian:buster-slim

Poppler: 0.89.0

pdf2htmlEX: 0.18.8.rc1

 - This docker image builds the pdf2htmlEX project (https://github.com/pdf2htmlEX/).
   - It also creates a .deb file so other's can reference that file.
 - Builds poppler-utils
   - Located here: /pdf2htmlEX/poppler/build/utils/

Example Usage:
```
COPY --from=mindspacephx/docker-pdf2htmlex:1.0.1 /pdf2htmlEX/imageBuild/pdf2htmlEX-0.18.8*.deb /pdf2htmlex.deb

RUN mkdir -p /usr/share/man/man1 \
    && apt-get update  \
    && apt install -yq ./pdf2htmlex.deb \
    && rm -rf /var/lib/apt/lists/*
```