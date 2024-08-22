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
git clone --depth 1 https://github.com/0xACE8/0p3nwrt-syncmwan && mvdir 0p3nwrt-syncmwan
git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon
git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config
git clone --depth 1 https://github.com/gSpotx2f/luci-app-cpu-perf
#git clone --depth 1 https://github.com/sirpdboy/luci-app-autotimeset
git clone --depth 1 https://github.com/sirpdboy/luci-app-ddns-go ddnsgo && mv -n ddnsgo/*/ ./; rm -rf ddnsgo
git clone --depth 1 https://github.com/sirpdboy/netspeedtest speedtest && mv -f speedtest/*/ ./ && rm -rf speedtest
git clone --depth 1 https://github.com/kenzok78/luci-theme-argone
git clone --depth 1 https://github.com/kenzok78/luci-app-argone-config
#git clone --depth 1 https://github.com/gngpp/luci-theme-design
#git clone --depth 1 https://github.com/gngpp/luci-app-design-config
git clone --depth 1 https://github.com/sbwml/luci-app-mosdns openwrt-mos && mv -n openwrt-mos/{*mosdns,v2dat} ./; rm -rf openwrt-mos
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall2 passwall2 && mv -n passwall2/luci-app-passwall2 ./;rm -rf passwall2
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall passwall1 && mv -n passwall1/luci-app-passwall  ./; rm -rf passwall1
git clone --depth 1 https://github.com/muink/luci-app-homeproxy
git clone --depth 1 https://github.com/Zxilly/UA2F openwrt-ua2f && mv -n openwrt-ua2f/openwrt ./ && mv openwrt ua2f; rm -rf openwrt-ua2f
git clone --depth 1 https://github.com/lucikap/luci-app-ua2f luciua2f && mv -n luciua2f/luci-app-ua2f  ./; rm -rf luciua2f
#git clone --depth 1 https://github.com/rufengsuixing/luci-app-syncdial && sed -i 's/is online and tracking is active/is online/g' luci-app-syncdial/luasrc/model/cbi/syncdial.lua
git clone --depth 1 https://github.com/tty228/luci-app-wechatpush
git clone --depth 1 https://github.com/firkerword/openwrt-wrtbwmon wrtbwmon1 && mv -n wrtbwmon1/wrtbwmon  ./; rm -rf wrtbwmon1

#sed -i "/minisign:minisign/d" luci-app-dnscrypt-proxy2/Makefile
sed -i 's/\(+luci-compat\)/\1 +luci-theme-argon/' luci-app-argon-config/Makefile
#sed -i 's/\(+luci-compat\)/\1 +luci-theme-design/' luci-app-design-config/Makefile
sed -i 's/\(+luci-compat\)/\1 +luci-theme-argone/' luci-app-argone-config/Makefile

exit 0
