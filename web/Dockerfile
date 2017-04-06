FROM alexpirine/django-mq:latest

RUN mkdir -p /provision

COPY ./provision/gunicorn.sh /provision/
RUN /provision/gunicorn.sh
