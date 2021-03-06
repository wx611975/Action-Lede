#!/bin/bash

echo "Apply custom.sh"

source ../version
sed -i '92d'                                                                   package/system/opkg/Makefile
sed -i '/shadow/d'                     package/lean/default-settings/files/zzz-default-settings
sed -i '/nas/d'                     package/lean/default-settings/files/zzz-default-settings
sed -i "s/openwrt.proxy.ustclug.org/openwrt.download/g"  package/lean/default-settings/files/zzz-default-settings
sed -i "s/https:/R20.0.0/g"  package/lean/default-settings/files/zzz-default-settings
sed -i  's/http:/snapshots/g'  package/lean/default-settings/files/zzz-default-settings
sed -i  "s/R20\(.[0-9].[0-9]\{1,2\}\)/R20.$version/g" package/lean/default-settings/files/zzz-default-settings
sed -i 's/DEPENDS.*/& \+luci-i18n-samba-zh-cn/g'  package/lean/autosamba/Makefile

rm -rf package/lean/luci-theme-argon
git clone https://github.com/CCnut/feed-netkeeper.git -b openwrt-18.06                                   package/nk
git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom.git                             package/luci-theme-infinityfreedom
git clone https://github.com/yangsongli/luci-theme-atmaterial.git                                        package/luci-theme-atmaterial
git clone https://github.com/destan19/OpenAppFilter.git                                                  package/oaf
git clone https://github.com/jerrykuku/luci-theme-argon.git -b 18.06                                     package/luci-theme-argon
git clone https://github.com/tty228/luci-app-serverchan.git                                              package/luci-app-serverchan
git clone https://github.com/vernesong/OpenClash.git -b master                                           package/luci-app-openclash
svn co https://github.com/Lienol/openwrt/trunk/package/diy/luci-app-adguardhome                          package/adg
svn co https://github.com/Lienol/openwrt-luci/trunk/applications/luci-app-smartdns                       package/luci-app-smartdns

      


