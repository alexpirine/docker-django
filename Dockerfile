FROM ubuntu:16.04

SHELL ["bash", "-c"]

RUN mkdir -p /provision

COPY ./provision/update.sh /provision/
RUN /provision/update.sh

COPY ./provision/bash_aliases.sh /provision/
RUN /provision/bash_aliases.sh

COPY ./provision/python.sh /provision/
RUN /provision/python.sh

COPY ./provision/supervisor.sh /provision/
RUN /provision/supervisor.sh

COPY ./provision/app.sh /provision/
RUN /provision/app.sh

RUN rm -fr /provision

RUN mkdir -p /app/code
WORKDIR /app/code
