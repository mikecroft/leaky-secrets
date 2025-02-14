FROM registry.redhat.io/ubi9/ubi-minimal:9.5

ENV AWS_CREDS=.aws/credentials

RUN mkdir .aws && \
    microdnf install -y python

RUN --mount=type=secret,id=awscreds,dst=$AWS_CREDS \
    cat $AWS_CREDS

RUN --mount=type=secret,id=ghtoken,dst=.env \
    cat .env

ENTRYPOINT [ "python" ]

CMD [ "-m", "http.server", "8080" ]