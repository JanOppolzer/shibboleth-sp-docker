# Shibboleth SP running in Docker

1. If you prefer Ubuntu 18.04 LTS (Bionic Beaver) instead of Debian 9 Stretch, comment out the first line and uncomment the second line of `Dockerfile`.
2. Copy an _HTTPS_ certificate to `files/apache-cert.pem`.
3. Copy a certificate's key to `files/apache-key.pem`.
4. Copy a certificate CA chain to `files/apache-chain.pem`.
5. Change `host.domain.tld` in `files/certificate.cnf.example` accordingly and remove `.example` extension.
6. Edit `files/metadata-template.xml.example` to fit your needs and remove `.example` extension.
7. Update `files/shibboleth2.xml.example`, at least `entityID`, `<SSO>` and `<MetadataProvider>` and remove `.example` extension.
8. Run `./certificate.sh` script to generate metadata certificates.
9. Run `./build.sh` to build a Docker image.
10. Execute `./run.sh` to run a Docker container with Shibboleth SP. (By default, port 80 is for _HTTP_ and 443 for _HTTPS_, but you can specify your own with the following command: `./run.sh 8080 8443`)

