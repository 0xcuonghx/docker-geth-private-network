FROM ethereum/client-go:v1.9.25

RUN apk update &&\
  apk add git nodejs bash perl libusb libusb-dev

ADD start.sh /root/start.sh
RUN chmod +x /root/start.sh

ENTRYPOINT /root/start.sh