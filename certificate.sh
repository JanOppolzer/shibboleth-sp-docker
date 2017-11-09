#!/usr/bin/env bash

openssl req -new -x509 -config files/certificate.cnf -text -out files/sp-cert.pem -days 3652 -nodes

