FROM registry.redhat.io/ubi9/ubi-minimal:9.5

COPY .env .
ENV AWS_CREDS=.aws/credentials

RUN microdnf install -y python && \
    mkdir .aws && \
    echo "AWS_ACCESS_KEY_ID=AKIA0123456789ABCDEF" >> $AWS_CREDS # notsecret
RUN echo "AWS_SECRET_KEY=12ASD34qwe56CXZ78tyH10Tna543VBokN85RHCas" >> $AWS_CREDS # notsecret 


RUN cat .env && \
    cat ${AWS_CREDS}

RUN rm .env && \
        rm ${AWS_CREDS}

ENTRYPOINT [ "python" ]

CMD [ "-m", "http.server", "8080" ]