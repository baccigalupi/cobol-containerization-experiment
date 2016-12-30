FROM gregcoleman/docker-cobol
MAINTAINER Kane Baccigalupi <baccigalupi@gmail.com>

RUN mkdir /dist/
ADD src   /src
ADD data  /data

# compile all the scripts
RUN cobc -free -x -o dist/invest src/invest.cob
RUN cobc -free -x -o dist/report src/report.cob
