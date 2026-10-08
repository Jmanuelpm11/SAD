FROM debian:12-slim

RUN apt-get update && apt-get install -y \
    krb5-user \
    ldap-utils \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY ca.crt /usr/local/share/ca-certificates/ca.crt
RUN update-ca-certificates

ENV LDAPTLS_CACERT=/pki/ca/ca.crt

CMD ["tail", "-f", "/dev/null"]
