FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    krb5-user \
    libpam-krb5 \
    libnss-ldap \
    ldap-utils \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/ldap && echo "TLS_CACERT /pki/ca/ca.crt" >> /etc/ldap/ldap.conf

CMD ["sleep", "infinity"]
