FROM debian:buster
LABEL MAINTAINER Jacobo Nájera <jacobo@jacobo.org>

EXPOSE 9001

RUN apt-get update && apt-get install -y wget gpg

RUN echo "deb http://deb.torproject.org/torproject.org buster main" >> /etc/apt/sources.list
RUN wget https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc
RUN DEBIAN_FRONTEND=noninteractive apt-key add <A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc

RUN apt-get update && apt-get install -y deb.torproject.org-keyring tor tor-geoipdb openssl

COPY tor-relay.conf /etc/tor/torrc

ENTRYPOINT [ "tor" ]


