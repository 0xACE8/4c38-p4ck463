#!/bin/bash
function git_clone() {
  git clone --depth 1 $1 $2 || true
 }
function git_sparse_clone() {
  branch="$1" rurl="$2" localdir="$3" && shift 3
  git clone -b $branch --depth 1 --filter=blob:none --sparse $rurl $localdir
  cd $localdir
  git sparse-checkout init --cone
  git sparse-checkout set $@
  mv -n $@ ../
  cd ..
  rm -rf $localdir
  }
function mvdir() {
mv -n `find $1/* -maxdepth 0 -type d` ./
rm -rf $1
}
git clone --depth 1 https://github.com/0xACE8/0p3nwrt-udp2raw && mvdir 0p3nwrt-udp2raw
git clone --depth 1 https://github.com/0xACE8/0p3nwrt-udpspeeder && mvdir 0p3nwrt-udpspeeder
git clone --depth 1 https://github.com/0xACE8/0p3nwrt-kcptun && mvdir 0p3nwrt-kcptun
git clone --depth 1 https://github.com/0xACE8/0p3nwrt-tailscale && mvdir 0p3nwrt-tailscale
#git clone --depth 1 https://github.com/0xACE8/0p3nwrt-dnscrypt-proxy2 && mvdir 0p3nwrt-dnscrypt-proxy2
#git clone --depth 1 https://github.com/0xACE8/0p3nwrt-syncmwan sync && mv -n sync/luci-app-syncdial ./; rm -rf sync
#git clone --depth 1 https://github.com/0xACE8/0p3nwrt-syncmwan && mvdir 0p3nwrt-syncmwan
git clone --depth 1 branch=v2 https://github.com/0xACE8/0p3nwrt-natter && mvdir 0p3nwrt-natter
git clone --depth 1 https://github.com/0xACE8/0p3nwrt-tinyfecvpn && mvdir 0p3nwrt-tinyfecvpn
git clone --depth 1 https://github.com/0xACE8/0p3nwrt-tinyportmapper && mvdir 0p3nwrt-tinyportmapper

# syncdial & mwan3
#git clone --depth 1 https://github.com/kiddin9/openwrt-packages kid && mv -n kid/luci-app-syncdial ./; rm -rf kid
#git clone --depth 1 https://github.com/x-wrt/luci xwrt && mv -n xwrt/applications/luci-app-mwan3 ./; rm -rf xwrt
git clone --depth 1 branch=master https://github.com/immortalwrt/packages mwan && mv -n mwan/net/mwan3 ./; rm -rf mwan
git clone --depth 1 branch=master https://github.com/immortalwrt/luci lmwan && mv -n lmwan/applications/luci-app-mwan3 ./; rm -rf lmwan
git clone --depth 1 branch=master https://github.com/immortalwrt/luci lsd && mv -n lsd/applications/luci-app-syncdial ./; rm -rf lsd

# other
git clone --depth 1 https://github.com/EasyTier/luci-app-easytier
git clone --depth 1 https://github.com/cddcx/luci-lib-fs
#git clone --depth 1 https://github.com/lisaac/luci-app-diskman diskm && mv -n diskm/applications/luci-app-diskman ./; rm -rf diskm
#git clone --depth 1 https://github.com/gSpotx2f/luci-app-cpu-perf
#git clone --depth 1 https://github.com/sirpdboy/luci-app-autotimeset
#git clone --depth 1 https://github.com/sirpdboy/netspeedtest speedtest && mv -f speedtest/*/ ./ && rm -rf speedtest
#git clone --depth 1 https://github.com/sirpdboy/luci-app-partexp
#git clone --depth 1 https://github.com/sirpdboy/luci-app-advanced && mvdir luci-app-advanced

# theme
git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon
git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config
#git clone --depth 1 https://github.com/kenzok78/luci-theme-argone
#git clone --depth 1 https://github.com/kenzok78/luci-app-argone-config
#git clone --depth 1 https://github.com/gngpp/luci-theme-design
#git clone --depth 1 https://github.com/gngpp/luci-app-design-config
git clone --depth 1 branch=master https://github.com/immortalwrt/packages lol && mv -n lol/utils/lolcat ./; rm -rf lol

# dns
git clone --depth 1 https://github.com/immortalwrt/packages impack && mv -n impack/net/dnscrypt-proxy2 ./; rm -rf impack
git clone --depth 1 https://github.com/sbwml/luci-app-mosdns openwrt-mos && mv -n openwrt-mos/{*mosdns,v2dat} ./; rm -rf openwrt-mos
git clone --depth 1 https://github.com/sirpdboy/luci-app-ddns-go ddnsgo && mv -n ddnsgo/*/ ./; rm -rf ddnsgo

# fuckwall
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall2 passwall2 && mv -n passwall2/luci-app-passwall2 ./;rm -rf passwall2
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall passwall1 && mv -n passwall1/luci-app-passwall  ./; rm -rf passwall1
#git clone --depth 1 https://github.com/muink/luci-app-homeproxy

# ua2f
#git clone --depth 1 https://github.com/Zxilly/UA2F openwrt-ua2f && mv -n openwrt-ua2f/openwrt ./ && mv openwrt ua2f; rm -rf openwrt-ua2f
#git clone --depth 1 https://github.com/lucikap/luci-app-ua2f luciua2f && mv -n luciua2f/luci-app-ua2f  ./; rm -rf luciua2f

# push
#git clone --depth 1 https://github.com/gaoyaxuan/luci-app-pushbot
#git clone --depth 1 https://github.com/tty228/luci-app-wechatpush
#git clone --depth 1 https://github.com/firkerword/openwrt-wrtbwmon wrtbwmon1 && mv -n wrtbwmon1/wrtbwmon  ./; rm -rf wrtbwmon1
#git clone --depth 1 https://github.com/catcat0921/OpenWRT_ipk serverchan1 && mv -n serverchan1/luci-app-serverchan  ./; rm -rf serverchan1

# network
#git clone --depth 1 https://github.com/gdy666/luci-app-lucky lucky1 && mv -n lucky1/*lucky ./; rm -rf lucky1
git clone --depth 1 https://github.com/awe1p/stun
#git clone --depth 1 https://github.com/muink/openwrt-go-stun

# patch
sed -i 's\../../\$(TOPDIR)/feeds/packages/\g' dnscrypt-proxy2/Makefile
#sed -i 's/vpn/services/g' luci-app-easytier/luasrc/controller/easytier.lua
#sed -i 's/, 46)/, 90)/g' luci-app-easytier/luasrc/controller/easytier.lua
sed -i 's/LUCI_DEPENDS:=/LUCI_DEPENDS:=+kmod-tun +luci-lib-fs/g' luci-app-easytier/Makefile
#sed -i 's/微信推送/TG Push/g' luci-app-wechatpush/po/zh_Hans/wechatpush.po
#sed -i '4d' luci-app-wechatpush/root/usr/share/luci/menu.d/luci-app-wechatpush.json
#sed -i '4 i\\t\t"order": 60,' luci-app-wechatpush/root/usr/share/luci/menu.d/luci-app-wechatpush.json
sed -i 's/, 30)/, 60)/g' luci-theme-serverchan/luasrc/controller/serverchan.lua
#sed -i "/minisign:minisign/d" luci-app-dnscrypt-proxy2/Makefile
sed -i 's/\(+luci-compat\)/\1 +luci-theme-argon/' luci-app-argon-config/Makefile
sed -i "s/), 0)/), -1)/g" luci-app-passwall2/luasrc/controller/passwall2.lua
sed -i "s/nil, 0)/nil, -1)/g" luci-app-passwall2/luasrc/controller/passwall2.lua
#sed -i 's/\(+luci-compat\)/\1 +luci-theme-design/' luci-app-design-config/Makefile
#sed -i 's/\(+luci-compat\)/\1 +luci-theme-argone/' luci-app-argone-config/Makefile

exit 0
