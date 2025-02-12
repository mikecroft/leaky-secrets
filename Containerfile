FROM registry.redhat.io/ubi9/ubi-minimal:9.5

COPY .env .

RUN rm .env