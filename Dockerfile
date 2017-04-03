FROM ubuntu:16.04

COPY ./provision.sh /provision.sh
RUN /provision.sh

RUN mkdir -p /app/code
WORKDIR /app/code
