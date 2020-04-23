FROM python:3.6

RUN pip install -U pip

RUN mkdir -p /provision

COPY ./provision/update.sh /provision/
RUN /provision/update.sh

COPY ./provision/bash_aliases.sh /provision/
RUN /provision/bash_aliases.sh

COPY ./provision/app.sh /provision/
RUN /provision/app.sh

RUN rm -fr /provision

RUN mkdir -p /app/code
WORKDIR /app/code
