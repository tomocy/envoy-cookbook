#!/bin/bash

echo 'Generate server key, which is often of CA priavte key'
openssl genrsa 2048 > server.key

echo 'Create CSR'
openssl req -new -key server.key > server.csr

echo 'Sign the CSR with its private key, which is also of the private key of the subject'
openssl x509 -req -signkey server.key < server.csr > server.crt