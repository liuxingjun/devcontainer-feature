#!/bin/sh

# proto
export PROTOC_VERSION="${PROTOC_VERSION:-"3.20.1"}"
export PB_REL="https://github.com/protocolbuffers/protobuf/releases"
curl -LO "$PB_REL/download/v$PROTOC_VERSION/protoc-$PROTOC_VERSION-linux-x86_64.zip"
unzip protoc-$PROTOC_VERSION-linux-x86_64.zip -d /usr/local

export PROTOC_GEN_GO_VERSION="${PROTOC_GEN_GO_VERSION:-"latest"}"
go install google.golang.org/protobuf/cmd/protoc-gen-go@$PROTOC_GEN_GO_VERSION

export PROTOC_GEN_GO_GRPC_VERSION="${PROTOC_GEN_GO_GRPC_VERSION:-"latest"}"
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@$PROTOC_GEN_GO_GRPC_VERSION