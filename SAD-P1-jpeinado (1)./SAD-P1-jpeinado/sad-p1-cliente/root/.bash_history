cd /ldif
ldapadd -x -H ldap://ldap.securecorp.local -D "cn=admin,dc=securecorp,dc=local" -W -f 01-ejemplo.ldif
ls
nano 02-tu-turno.ldif 
ldapadd -x -H ldap://ldap.securecorp.local -D "cn=admin,dc=securecorp,dc=local" -W -f 02-tu-turno.ldif
nano 02-tu-turno.ldif 
ldappasswd -x -H ldap://ldap.securecorp.local -D "cn=admin,dc=securecorp,dc=local" -W -s 'jpeinado' "uid=jpeinado,ou=people,dc=securecorp,dc=local"
ldappasswd -x -H ldap://ldap.securecorp.local -D "cn=admin,dc=securecorp,dc=local" -W -s 'MartaPassword2026' "uid=mtorres,ou=people,dc=securecorp,dc=local"
ldappasswd -x -H ldap://ldap.securecorp.local -D "cn=admin,dc=securecorp,dc=local" -W -s 'mtorres' "uid=mtorres,ou=people,dc=securecorp,dc=local"
ldapwhoami -x -H ldap://ldap.securecorp.local -D "uid=jpeinado,ou=people,dc=securecorp,dc=local" -w 'jpeinado'
exit
exit
ldapadd -x -H ldap://ldap.securecorp.local -D "cn=admin,dc=securecorp,dc=local" -W -f 01-ejemplo.ldif
cd /ldif
ldapadd -x -H ldap://ldap.securecorp.local -D "cn=admin,dc=securecorp,dc=local" -W -f 01-ejemplo.ldif
ldapadd -x -H ldap://ldap.securecorp.local -D "cn=admin,dc=securecorp,dc=local" -W -f 01-ejemplo.ldif
ldappasswd -x -H ldap://ldap.securecorp.local -D "cn=admin,dc=securecorp,dc=local" -W -s 'Lucia2026' "uid=lromero,ou=people,dc=securecorp,dc=local"
ldappasswd -x -H ldap://ldap.securecorp.local -D "cn=admin,dc=securecorp,dc=local" -W -s 'Lucia2026' "uid=lromero,ou=people,dc=securecorp,dc=local"
exit
ls
nano /etc/ldap/ldap.conf
nano /etc/ldap/ldap.conf
exit
# CLIENTE
kinit lromero        # Introduce la contraseña de Lucía (pide pulsera / TGT)[cite: 1]
kinit jpeinado       # Introduce tu contraseña[cite: 1]
kvno host/web.securecorp.local   # Pide un ticket de servicio para la web[cite: 1]
klist                # Muestra tus tickets actuales[cite: 1]
exit
kinit mtorres
exit
