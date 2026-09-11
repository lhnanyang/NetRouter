#!/bin/bash

set -e

OPENWRT_DIR="$(cd "$(dirname "$0")/src" && pwd)"

echo "OpenWrt source: $OPENWRT_DIR"

# OpenClash
rm -rf "$OPENWRT_DIR/package/openclash"

git clone \
  --depth=1 \
  https://github.com/vernesong/OpenClash.git \
  "$OPENWRT_DIR/package/openclash"

echo "OpenClash added successfully."
