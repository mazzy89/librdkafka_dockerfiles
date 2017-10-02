FROM alpine

ENV VERSION v0.11.0

RUN apk add --update --no-cache alpine-sdk bash python \
  && git clone https://github.com/edenhill/librdkafka.git /opt/librdkafka

WORKDIR /opt/librdkafka
RUN git checkout "$VERSION"

RUN ./configure \
  && make \
  && make install
