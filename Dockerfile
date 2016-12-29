FROM gregcoleman/docker-cobol
MAINTAINER Kane Baccigalupi <baccigalupi@gmail.com>

RUN mkdir /src/
RUN mkdir /dist/
ADD src/invest.cob /src/

RUN cobc -free -x -o dist/invest src/invest.cob
