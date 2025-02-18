FROM image-registry.openshift-image-registry.svc:5000/leak-test/custom-buildah-image:latest

ENV AWS_CREDS=.aws/credentials

RUN mkdir .aws && \
    microdnf install -y python

RUN --mount=type=secret,id=AWS_ACCESS_KEY_ID \
    --mount=type=secret,id=AWS_SECRET_KEY \
    echo "AWS_ACCESS_KEY_ID=$(cat /run/secrets/AWS_ACCESS_KEY_ID)" && \
    echo "AWS_SECRET_KEY=$(cat /run/secrets/AWS_SECRET_KEY)"

RUN --mount=type=secret,id=ghtoken,dst=.env \
    cat .env

ENTRYPOINT [ "python" ]

CMD [ "-m", "http.server", "8080" ]