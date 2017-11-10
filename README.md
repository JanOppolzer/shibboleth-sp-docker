# shibboleth-sp-docker

1. Copy a HTTPS certificate to `files/apache-cert.pem`.
2. Copy a certificate's key to `files/apache-key.pem`.
3. Copy a certificate CA chain to `files/apache-chain.pem`.
4. Change `host.domain.tld` in `files/certificate.cnf.example` accordingly and remove `.example` extension.
5. Edit `files/metadata-template.xml` to fit your needs and remove `.example` extension.
6. Update `files/shibboleth2.xml`, at least `entityID`, `<SSO>` and `<MetadataProvider>` and remove `.example` extension.
7. Run `./certificate.sh` script to generate metadata certificates.
8. Run `./build.sh` to build a Docker image.
9. Execute `./run.sh` to run a Docker container with Shibboleth SP.

