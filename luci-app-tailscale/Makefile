# SPDX-License-Identifier: GPL-3.0-only
#
# Copyright (C) 2024 asvow

include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI for Tailscale
LUCI_DEPENDS:=+tailscale +jsonfilter +ucode
LUCI_PKGARCH:=all

PKG_VERSION:=1.0.6

include $(TOPDIR)/feeds/luci/luci.mk

define Package/$(PKG_NAME)/postinst
#!/bin/sh
chmod 755 "$${IPKG_INSTROOT}/etc/init.d/tailscale" >/dev/null 2>&1
ln -sf "../init.d/tailscale" \
	"$${IPKG_INSTROOT}/etc/rc.d/S90tailscale" >/dev/null 2>&1
exit 0
endef

# call BuildPackage - OpenWrt buildroot signature
