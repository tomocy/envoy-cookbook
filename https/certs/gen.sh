#!/bin/bash

echo 'Generate CA certificate'
mkdir ca

openssl genrsa 4096 > ca/ca.key

openssl req \
-new \
-key ca/ca.key \
-subj '/CN=ca.example.local' \
> ca/ca.csr

openssl x509 \
-req \
-signkey ca/ca.key \
< ca/ca.csr \
> ca/ca.crt

echo ''
echo 'Generate server certificate signed by the CA'
mkdir server

openssl genrsa 2096 > server/server.key

openssl req \
-new \
-key server/server.key \
-subj '/CN=server.example.local' \
> server/server.csr

openssl x509 \
-req \
-CA ca/ca.crt \
-CAkey ca/ca.key \
-CAcreateserial \
< server/server.csr \
> server/server.crt