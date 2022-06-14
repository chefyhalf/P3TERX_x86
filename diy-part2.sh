#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
# Add luci-app-ssr-plus
# pushd package/lean
# git clone --depth=1 https://github.com/kenzok8/openwrt-packages/tree/master/luci-app-ssr-plus
# popd

# Add luci-app-bypass
pushd package/lean
git clone --depth=1 https://github.com/kenzok8/openwrt-packages/tree/master/luci-app-bypass
popd

# Clone community packages to package/community
mkdir package/community
pushd package/community

# Add wolplus
git clone --depth=1 https://github.com/siwind/luci-app-wolplus

# Add poweroffdevice
# git clone --depth=1 https://github.com/sirpdboy/luci-app-poweroffdevice

# Add ServerChan
git clone --depth=1 https://github.com/tty228/luci-app-serverchan

# Add OpenClash
git clone --depth=1 -b master https://github.com/vernesong/OpenClash

# Add UnblockNeteaseMusic
git clone --depth=1 https://github.com/kenzok8/openwrt-packages/tree/master/UnblockNeteaseMusic

# Use Lienol's https-dns-proxy package
pushd feeds/packages/net
rm -rf https-dns-proxy
svn co https://github.com/Lienol/openwrt-packages/trunk/net/https-dns-proxy
popd

# Use snapshots' syncthing package
pushd feeds/packages/utils
rm -rf syncthing
svn co https://github.com/openwrt/packages/trunk/utils/syncthing
popd
