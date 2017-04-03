FROM ubuntu:16.04

COPY ./provision /provision
RUN /provision/update.sh
RUN /provision/bash_aliases.sh
RUN /provision/python.sh
RUN /provision/supervisor.sh
RUN /provision/app.sh

RUN mkdir -p /app/code
WORKDIR /app/code
