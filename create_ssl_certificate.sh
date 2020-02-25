
#!/bin/bash
set -e


echo "Creating certificate and key..."

openssl req -x509 -newkey rsa:4096 -sha256 -days 365 -nodes   -keyout /home/tf/key.pem -out /home/tf/cert.pem -extensions san -config   <(echo "[req]";
    echo distinguished_name=req;
    echo "[san]";
    echo extendedKeyUsage=serverAuth;
    echo subjectAltName=DNS:localhost,DNS:localhost,IP:192.0.0.1
    )   -subj /CN=localhost




