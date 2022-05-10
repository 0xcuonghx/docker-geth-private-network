FROM ethereum/client-go:v1.10.17

RUN apk update &&\
  apk add git nodejs bash perl

ADD start.sh /root/start.sh
RUN chmod +x /root/start.sh

ENTRYPOINT /root/start.sh