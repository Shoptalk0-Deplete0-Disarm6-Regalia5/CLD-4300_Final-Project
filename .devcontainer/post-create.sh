#!/usr/bin/env bash
set -euo pipefail

HUGO_VER="0.157.0"
TAR_URL="https://github.com/gohugoio/hugo/releases/download/v${HUGO_VER}/hugo_${HUGO_VER}_Linux-64bit.tar.gz"
TMP_TAR="/tmp/hugo.tar.gz"

sudo apt-get update -y
sudo apt-get install -y ca-certificates curl git

curl -L -o "${TMP_TAR}" "${TAR_URL}"
tar -xzf "${TMP_TAR}" -C /tmp
sudo mv /tmp/hugo /usr/local/bin/hugo
sudo chmod +x /usr/local/bin/hugo
rm -f "${TMP_TAR}"

hugo version

git submodule update --init --recursive || true
