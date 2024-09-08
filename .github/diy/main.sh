#!/bin/bash

function merge_package() {
    # 参数1是分支名,参数2是库地址,参数3是所有文件下载到指定路径。
    # 同一个仓库下载多个文件夹直接在后面跟文件名或路径，空格分开。
    if [[ $# -lt 3 ]]; then
        echo "Syntax error: [$#] [$*]" >&2
        return 1
    fi
    trap 'rm -rf "$tmpdir"' EXIT
    branch="$1" curl="$2" target_dir="$3" && shift 3
    rootdir="$PWD"
    localdir="$target_dir"
    [ -d "$localdir" ] || mkdir -p "$localdir"
    tmpdir="$(mktemp -d)" || exit 1
    git clone -b "$branch" --depth 1 --filter=blob:none --sparse "$curl" "$tmpdir"
    cd "$tmpdir"
    git sparse-checkout init --cone
    git sparse-checkout set "$@"
    # 使用循环逐个移动文件夹
    for folder in "$@"; do
        mv -f "$folder" "$rootdir/$localdir"
    done
    cd "$rootdir"
}

#merge_package main https://github.com/shiyu1314/openwrt-onecloud target/linux kernel/6.6/amlogic
merge_package main https://github.com/0xACE8/0p3nwrt-udp2raw . 0p3nwrt-udp2raw
merge_package main https://github.com/0xACE8/0p3nwrt-udpspeeder . 0p3nwrt-udpspeeder
merge_package main https://github.com/0xACE8/0p3nwrt-kcptun . 0p3nwrt-kcptun
merge_package main https://github.com/0xACE8/0p3nwrt-tailscale . 0p3nwrt-tailscale
#merge_package main https://github.com/0xACE8/0p3nwrt-syncmwan . 0p3nwrt-syncmwan
merge_package main https://github.com/0xACE8/0p3nwrt-natter . 0p3nwrt-natter
merge_package v2 https://github.com/0xACE8/0p3nwrt-natter . 0p3nwrt-natter
merge_package main https://github.com/0xACE8/0p3nwrt-tinyfecvpn . 0p3nwrt-tinyfecvpn

# other
#git clone --depth 1 https://github.com/rufengsuixing/luci-app-syncdial && sed -i 's/is online and tracking is active/is online/g' luci-app-syncdial/luasrc/model/cbi/syncdial.lua
#git clone --depth 1 https://github.com/gSpotx2f/luci-app-cpu-perf
#git clone --depth 1 https://github.com/sirpdboy/luci-app-autotimeset
#git clone --depth 1 https://github.com/sirpdboy/netspeedtest speedtest && mv -f speedtest/*/ ./ && rm -rf speedtest

# theme
merge_package master https://github.com/jerrykuku/luci-theme-argon luci-theme-argon .
merge_package master https://github.com/jerrykuku/luci-app-argon-config luci-app-argon-config .
merge_package main https://github.com/kenzok78/luci-theme-argone luci-theme-argone .
merge_package main https://github.com/kenzok78/luci-app-argone-config luci-app-argone-config .

# dns
merge_package v5 https://github.com/sbwml/luci-app-mosdns . . && rm -rf readme && rm --rf install.sh
merge_package main https://github.com/sirpdboy/luci-app-ddns-go . .

# fuckwall
merge_package main https://github.com/xiaorouji/openwrt-passwall2 . luci-app-passwall2 && sed -i "s/), 0)/), -1)/g" luci-app-passwall2/luasrc/controller/passwall2.lua && sed -i "s/nil, 0)/nil, -1)/g" luci-app-passwall2/luasrc/controller/passwall2.lua
merge_package main https://github.com/xiaorouji/openwrt-passwall . luci-app-passwall
#git clone --depth 1 https://github.com/muink/luci-app-homeproxy

# ua2f
#git clone --depth 1 https://github.com/Zxilly/UA2F openwrt-ua2f && mv -n openwrt-ua2f/openwrt ./ && mv openwrt ua2f; rm -rf openwrt-ua2f
#git clone --depth 1 https://github.com/lucikap/luci-app-ua2f luciua2f && mv -n luciua2f/luci-app-ua2f  ./; rm -rf luciua2f

# push
#git clone --depth 1 https://github.com/gaoyaxuan/luci-app-pushbot
#git clone --depth 1 https://github.com/tty228/luci-app-wechatpush
#git clone --depth 1 https://github.com/firkerword/openwrt-wrtbwmon wrtbwmon1 && mv -n wrtbwmon1/wrtbwmon  ./; rm -rf wrtbwmon1
merge_package main https://github.com/catcat0921/OpenWRT_ipk . luci-app-serverchan

# network
#git clone --depth 1 https://github.com/gdy666/luci-app-lucky lucky1 && mv -n lucky1/*lucky ./; rm -rf lucky1
merge_package master https://github.com/awe1p/stun stun .
#git clone --depth 1 https://github.com/muink/openwrt-go-stun

#sed -i "/minisign:minisign/d" luci-app-dnscrypt-proxy2/Makefile
sed -i 's/\(+luci-compat\)/\1 +luci-theme-argon/' luci-app-argon-config/Makefile
#sed -i 's/\(+luci-compat\)/\1 +luci-theme-design/' luci-app-design-config/Makefile
#sed -i 's/\(+luci-compat\)/\1 +luci-theme-argone/' luci-app-argone-config/Makefile


#function git_clone() {
#  git clone --depth 1 $1 $2 || true
# }
#function git_sparse_clone() {
#  branch="$1" rurl="$2" localdir="$3" && shift 3
#  git clone -b $branch --depth 1 --filter=blob:none --sparse $rurl $localdir
#  cd $localdir
#  git sparse-checkout init --cone
#  git sparse-checkout set $@
#  mv -n $@ ../
#  cd ..
#  rm -rf $localdir
#  }
#function mvdir() {
#mv -n `find $1/* -maxdepth 0 -type d` ./
#rm -rf $1
#}


exit 0
