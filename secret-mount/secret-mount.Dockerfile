FROM registry.redhat.io/ubi9/ubi-minimal:9.5

RUN --mount=type=secret,id=mysecrets,dst=.env \
    cat .env