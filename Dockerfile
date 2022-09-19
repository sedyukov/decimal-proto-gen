FROM ubuntu:latest
WORKDIR /proto-gen
COPY image-files .

# Cerrificate
RUN apt-get update
RUN apt-get install -y ca-certificates
COPY cacert.pem /etc/pki/trust/anchors/
RUN update-ca-certificates

# Install go 
RUN tar -C /usr/local -xzvf go1.19.1.linux-amd64.tar.gz
ENV PATH="$PATH:/usr/local/go/bin:$HOME/go/bin"

# Install go deps
RUN go mod init proto-gen-decimal
RUN go get github.com/regen-network/cosmos-proto@latest
RUN go get github.com/regen-network/cosmos-proto/protoc-gen-gocosmos@latest
RUN go get github.com/pseudomuto/protoc-gen-doc/cmd/protoc-gen-doc@latest
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
RUN go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
RUN go install github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway@v1.16.0
RUN go install github.com/cosmos/cosmos-proto/cmd/protoc-gen-go-pulsar@latest
RUN go install github.com/regen-network/cosmos-proto/protoc-gen-gocosmos
RUN go install github.com/pseudomuto/protoc-gen-doc/cmd/protoc-gen-doc

# Install Buf
RUN apt update
RUN apt install curl -y
RUN scripts/buf-binary-install.sh

# Install node and npm
RUN apt install nodejs -y
RUN apt install npm -y

# Install npm deps
RUN npm install -g ts-proto
RUN npm install -g protoc-gen-ts

