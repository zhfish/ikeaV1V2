ipsec pki --gen --outform pem > ca.pem
ipsec pki --self --in ca.pem --dn "C=CN, O=strongSwan, CN=strongSwan CA" --ca --outform pem > ca.cert.pem
ipsec pki --gen --outform pem > server.pem
ipsec pki --pub --in server.pem | ipsec pki --issue --cacert ca.cert.pem \
--cakey ca.pem --dn "C=CN, O=strongSwan, CN=vpn.domain.com" \
--san="vpn.domain.com" --flag serverAuth --flag ikeIntermediate \
--outform pem > server.cert.pem
ipsec pki --gen --outform pem > client.pem
ipsec pki --pub --in client.pem | ipsec pki --issue --cacert ca.cert.pem \
--cakey ca.pem --dn "C=CN, O=strongSwan, CN=vpn.domain.com" \
--outform pem > client.cert.pem
openssl pkcs12 -export -inkey client.pem -in client.cert.pem -name "vpn.domain.com" \
-certfile ca.cert.pem -caname "strongSwan CA" -out client.cert.p12
cp -r ca.cert.pem /etc/ipsec.d/cacerts/
cp -r server.cert.pem /etc/ipsec.d/certs/
cp -r server.pem /etc/ipsec.d/private/
cp -r client.cert.pem /etc/ipsec.d/certs/
cp -r client.pem /etc/ipsec.d/private/
