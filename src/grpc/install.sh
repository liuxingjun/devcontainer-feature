#!/bin/sh

apt_get_update()
{
    if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
        echo "Running apt-get update..."
        apt-get update -y
    fi
}

# Checks if packages are installed and installs them if not
check_packages() {
    if ! dpkg -s "$@" > /dev/null 2>&1; then
        apt_get_update
        apt-get -y install --no-install-recommends "$@"
    fi
}
check_packages pkg-config curl ca-certificates unzip
# proto
export PROTOC_VERSION="${PROTOC_VERSION:-"3.20.1"}"
export PB_REL="https://github.com/protocolbuffers/protobuf/releases"
curl -LO "$PB_REL/download/v$PROTOC_VERSION/protoc-$PROTOC_VERSION-linux-x86_64.zip"
unzip protoc-$PROTOC_VERSION-linux-x86_64.zip -d /usr/local

export PROTOC_GEN_GO_VERSION="${PROTOC_GEN_GO_VERSION:-"latest"}"
go install google.golang.org/protobuf/cmd/protoc-gen-go@$PROTOC_GEN_GO_VERSION

export PROTOC_GEN_GO_GRPC_VERSION="${PROTOC_GEN_GO_GRPC_VERSION:-"latest"}"
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@$PROTOC_GEN_GO_GRPC_VERSION