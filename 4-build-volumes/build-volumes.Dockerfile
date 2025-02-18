FROM registry.redhat.io/ubi9/ubi-minimal:9.5

RUN microdnf install -y python

RUN ls -lah /run/secrets/.env && \
    ls -lah /run/secrets/.aws/credentials

ENTRYPOINT [ "python" ]

CMD [ "-m", "http.server", "8080" ]