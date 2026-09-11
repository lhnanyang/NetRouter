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

# ============================================================
# 选中主题包
#
# CI 里不能用 make menuconfig
# 直接写入 .config 即可
# ============================================================
CONFIG_FILE="$OPENWRT_DIR/.config"

if [ -f "$CONFIG_FILE" ]; then
  echo "CONFIG_PACKAGE_luci-theme-argon=y" >> "$CONFIG_FILE"
  echo "CONFIG_PACKAGE_luci-app-argon-config=y" >> "$CONFIG_FILE"

  echo "Argon theme enabled in .config."
else
  echo "⚠️ 未找到 .config，跳过主题启用"
fi

echo "diy.sh 执行完成。"
