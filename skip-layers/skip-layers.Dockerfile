FROM registry.redhat.io/ubi9/ubi-minimal:9.5

ARG PRIVATE=replaceme
COPY .env .

RUN echo $PRIVATE

RUN rm .env