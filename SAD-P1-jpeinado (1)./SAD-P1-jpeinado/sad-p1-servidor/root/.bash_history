mkdir -p /pki/ca && cd /pki/ca
openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:4096 -out ca.key
openssl req -x509 -new -key ca.key -sha256 -days 3650 \ -subj "/C=ES/O=SecureCorp/CN=SecureCorp Root CA - Juan Manuel Peinado" \ -addext "basicConstraints=critical,CA:TRUE" \ -addext "keyUsage=critical,keyCertSign,cRLSign" \ -out ca.crt
exit
mkdir -p /pki/ca && cd /pki/ca
# Borramos por si acaso hay ficheros incorrectos previos
rm -f ca.key ca.crt
# Generar la clave privada de la CA
openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:4096 -out ca.key
# Generar el certificado autofirmado de la CA
openssl req -x509 -new -key ca.key -sha256 -days 3650   -subj "/C=ES/O=SecureCorp/CN=SecureCorp Root CA - Tu Nombre Apellido"   -addext "basicConstraints=critical,CA:TRUE"   -addext "keyUsage=critical,keyCertSign,cRLSign"   -out ca.crt
exit
mkdir -p /pki/servidor && cd /pki/servidor
openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:2048 -out ldap.key
cat > ldap.ext <<'EOF'
basicConstraints = CA:FALSE
keyUsage = critical, digitalSignature, keyEncipherment
extendedKeyUsage = serverAuth
subjectAltName = DNS:ldap.securecorp.local
EOF

# 2. La petición de certificado
openssl req -new -key ldap.key -subj "/C=ES/O=SecureCorp/CN=ldap.securecorp.local" -out ldap.csr
# 3. La CA firma la petición (usando la CA que acabas de crear en A1)
openssl x509 -req -in ldap.csr -CA /pki/ca/ca.crt -CAkey /pki/ca/ca.key   -CAcreateserial -days 825 -sha256 -extfile ldap.ext -out ldap.crt
openssl verify -CAfile /pki/ca/ca.crt ldap.crt        # Debe devolver OK
openssl x509 -in ldap.crt -noout -subject -issuer     # El issuer debe ser tu CA
exit
# SERVIDOR
mkdir -p /etc/ldap/tls
cp /pki/ca/ca.crt /pki/servidor/ldap.crt /pki/servidor/ldap.key /etc/ldap/tls/
chown -R openldap:openldap /etc/ldap/tls
chmod 600 /etc/ldap/tls/ldap.key
ls -l /etc/ldap/tls
ldapmodify -Y EXTERNAL -H ldapi:/// -f /ldif/03-tls.ldif
cd /ldif
ls
nano 03-tls.ldif 
ldapmodify -Y EXTERNAL -H ldapi:/// -f /ldif/03-tls.ldif
/etc/default/slapd
cd ..
/etc/default/slapd
nano /etc/default/slapd
exit
nano /etc/default/slapd
nano /etc/default/slapd
exit
kdb5_util create -s -r SECURECORP.LOCAL     # Te pedirá una "master key" (contraseña maestra): invéntala y anótala
service krb5-kdc start                      # Arranca el servicio Kerberos
# SERVIDOR
kadmin.local -q "addprinc lromero"                              # Contraseña: la de Lucía (Lucia2026)
kadmin.local -q "addprinc jpeinado"                             # Contraseña: la tuya
kadmin.local -q "addprinc mtorres"                              # Contraseña: la de Marta[cite: 1]
kadmin.local -q "addprinc -randkey host/web.securecorp.local"   # Servicio con clave aleatoria[cite: 1]
kadmin.local -q "listprincs"                                    # Comprueba que aparecen todos[cite: 1]
exit
kadmin.local -q "modprinc +disallow_all_tickets mtorres"
kinit mtorres    # Esto fallará a propósito, que es justo lo que busca el script para registrar el rechazo
exit
kadmin.local -q "modprinc +disallow_all_tickets mtorres"
kinit mtorres    # Esto fallará a propósito, que es justo lo que busca el script para registrar el rechazo
exit
kadmin.local -q "modprinc +disallow_all_tickets mtorres"
kinit mtorres
exit
kadmin.local 
exit
