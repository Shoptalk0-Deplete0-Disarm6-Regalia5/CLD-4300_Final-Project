#!/usr/bin/env bash
set -euo pipefail

# Pin Hugo version
HUGO_VER="0.116.0"

# Basic packages
sudo apt-get update -y
sudo apt-get install -y ca-certificates curl git

# Install Hugo (Linux 64-bit)
curl -L -o /tmp/hugo.deb "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VER}/hugo_${HUGO_VER}_Linux-64bit.deb"
sudo dpkg -i /tmp/hugo.deb || true
rm -f /tmp/hugo.deb

# Verify install
hugo version

# Initialize git submodules (themes) if present
git submodule update --init --recursive || true
