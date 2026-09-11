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

#!/bin/bash

set -e

OPENWRT_DIR="$(cd "$(dirname "$0")/src" && pwd)"

echo "OpenWrt source: $OPENWRT_DIR"

# ============================================================
# OpenClash
# ============================================================
rm -rf "$OPENWRT_DIR/package/openclash"

git clone \
  --depth=1 \
  https://github.com/vernesong/OpenClash.git \
  "$OPENWRT_DIR/package/openclash"

echo "OpenClash added successfully."

# ============================================================
# Argon 主题
# ============================================================
rm -rf "$OPENWRT_DIR/package/luci-theme-argon"
rm -rf "$OPENWRT_DIR/package/luci-app-argon-config"

git clone \
  --depth=1 \
  https://github.com/jerrykuku/luci-theme-argon.git \
  "$OPENWRT_DIR/package/luci-theme-argon"

git clone \
  --depth=1 \
  https://github.com/jerrykuku/luci-app-argon-config.git \
  "$OPENWRT_DIR/package/luci-app-argon-config"

echo "Argon theme added successfully."



echo "diy.sh 执行完成。"
