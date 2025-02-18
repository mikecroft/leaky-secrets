FROM registry.redhat.io/ubi9/ubi-minimal:9.5

COPY .env .
ENV AWS_CREDS=.aws/credentials

RUN mkdir .aws
RUN echo "AWS_ACCESS_KEY_ID=AKIA0123456789ABCDEF" >> $AWS_CREDS && \ # notsecret
    echo "AWS_SECRET_KEY=12ASD34qwe56CXZ78tyH10Tna543VBokN85RHCas" >> $AWS_CREDS && \ # notsecret
    microdnf install -y python

RUN rm .env

ENTRYPOINT [ "python" ]

CMD [ "-m", "http.server", "8080" ]