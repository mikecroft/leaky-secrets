FROM registry.redhat.io/ubi9/ubi-minimal:9.5

COPY .env .

RUN echo "some commands here"

RUN env

RUN rm .env