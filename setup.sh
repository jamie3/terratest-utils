#!/bin/bash -e

# This script will do the following
# - Check if go is installed. If false, then downloads go
# - Downloads go packages for terratest

if [ -x "$(command -v go)" ]; then
    echo "Go installed... $(go version)"
else 
    echo "Downloading Go $GO_URL"
    GO_VERSION="1.11.5"
    GO_FILE="go""$GO_VERSION"".darwin-amd64.tar.gz"
    GO_URL=https://dl.google.com/go/$GO_FILE

    wget $GO_URL
    tar -zxvf go$G0_VERSION.darwin-amd64.tar.gz
fi

GO_FILES=(
    "github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

for i in "${GO_FILES[@]}"
do
    :
    echo "Downloading $i"
    go get $i
done
