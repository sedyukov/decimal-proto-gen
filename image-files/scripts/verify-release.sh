VERSION="1.8.0" && \
  curl -OL https://github.com/bufbuild/buf/releases/download/v${VERSION}/sha256.txt && \
  curl -OL https://github.com/bufbuild/buf/releases/download/v${VERSION}/sha256.txt.minisig && \
  minisign -Vm sha256.txt -P RWQ/i9xseZwBVE7pEniCNjlNOeeyp4BQgdZDLQcAohxEAH5Uj5DEKjv6