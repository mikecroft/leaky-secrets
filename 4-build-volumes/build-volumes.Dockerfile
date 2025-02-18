FROM registry.redhat.io/ubi9/ubi-minimal:9.5

RUN microdnf install -y python

RUN cat /run/secrets/.env && \
    cat /run/secrets/.aws/credentials

ENTRYPOINT [ "python" ]

CMD [ "-m", "http.server", "8080" ]