#
# Copyright (C) 2018 Hao Dong <halbertdong@gmail.com>
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI Support for udpspeeder-tunnel
LUCI_DEPENDS:=+UDPspeeder
LUCI_PKGARCH:=all

PKG_NAME:=luci-app-udpspeeder
PKG_VERSION:=1.1.0
PKG_RELEASE:=4

PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Hao Dong <halbertdong@gmail.com>

include $(TOPDIR)/feeds/luci/luci.mk

define Package/$(PKG_NAME)/postinst
#!/bin/sh
chmod 755 "$${IPKG_INSTROOT}/etc/init.d/udpspeeder" >/dev/null 2>&1
ln -sf "../init.d/udpspeeder" \
	"$${IPKG_INSTROOT}/etc/rc.d/S88udpspeeder" >/dev/null 2>&1
exit 0
endef

# call BuildPackage - OpenWrt buildroot signature
