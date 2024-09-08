#
# Copyright (C) 2019-2021 Tiou <dourokinga@gmail.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-tinyportmapper
PKG_VERSION:=1.0.1
PKG_RELEASE:=1

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Tiou <dourokinga@gmail.com>

include $(INCLUDE_DIR)/package.mk

PKG_BUILD_DEPENDS:=luci

define Package/$(PKG_NAME)
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=LuCI Support for tinyPortMapper
	PKGARCH:=all
	DEPENDS:=+tinyPortMapper
endef

define Package/$(PKG_NAME)/description
	LuCI Support for tinyPortMapper.
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh
if [ -z "$${IPKG_INSTROOT}" ]; then
	( . /etc/uci-defaults/luci-tinyportmapper ) && rm -f /etc/uci-defaults/luci-tinyportmapper
fi
exit 0
endef

define Package/$(PKG_NAME)/conffiles
	/etc/config/tinyportmapper
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DATA) ./luasrc/controller/*.lua $(1)/usr/lib/lua/luci/controller/
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model
	$(INSTALL_DATA) ./luasrc/model/*.lua $(1)/usr/lib/lua/luci/model/
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi/tinyportmapper
	$(INSTALL_DATA) ./luasrc/model/cbi/tinyportmapper/*.lua $(1)/usr/lib/lua/luci/model/cbi/tinyportmapper/
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/tinyportmapper
	$(INSTALL_DATA) ./luasrc/view/tinyportmapper/*.htm $(1)/usr/lib/lua/luci/view/tinyportmapper/
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./root/etc/config/tinyportmapper $(1)/etc/config/tinyportmapper
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./root/etc/init.d/tinyportmapper $(1)/etc/init.d/tinyportmapper
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./root/etc/uci-defaults/88_luci-tinyportmapper $(1)/etc/uci-defaults/88_luci-tinyportmapper
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
