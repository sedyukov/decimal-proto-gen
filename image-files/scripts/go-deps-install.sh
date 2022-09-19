#!/usr/bin/env bash


go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
go install github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway@v1.16.0
go install github.com/cosmos/cosmos-proto/cmd/protoc-gen-go-pulsar@latest

go get github.com/regen-network/cosmos-proto@latest
go get github.com/regen-network/cosmos-proto/protoc-gen-gocosmos@latest
go get github.com/pseudomuto/protoc-gen-doc/cmd/protoc-gen-doc@latest
go install github.com/regen-network/cosmos-proto/protoc-gen-gocosmos
go install github.com/pseudomuto/protoc-gen-doc/cmd/protoc-gen-doc