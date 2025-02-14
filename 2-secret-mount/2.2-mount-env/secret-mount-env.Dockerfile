FROM registry.redhat.io/ubi9/ubi-minimal:9.5

RUN microdnf install -y python

RUN --mount=type=secret,id=AWS_ACCESS_KEY_ID \
    --mount=type=secret,id=AWS_SECRET_KEY \
    echo "AWS_ACCESS_KEY_ID=$(cat /run/secrets/AWS_ACCESS_KEY_ID)" && \
    echo "AWS_SECRET_KEY=$(cat /run/secrets/AWS_SECRET_KEY)"


ENTRYPOINT [ "python" ]

CMD [ "-m", "http.server", "8080" ]