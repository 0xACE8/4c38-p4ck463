# SPDX-License-Identifier: GPL-3.0-only
#
# Copyright (C) 2021 ImmortalWrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=juicity
PKG_VERSION:=0.4.1
PKG_RELEASE:=$(AUTORELEASE)

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/juicity/juicity/tar.gz/v$(PKG_VERSION)?
PKG_HASH:=d93f0c637fe388eae5045508b0ce8020ff86314ffad9d0c47b5ca1d9e79749ff
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)/$(PKG_NAME)

PKG_LICENSE:=MIT
PKG_LICENSE_FILE:=LICENSE
PKG_MAINTAINER:=0xACE8

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0
PKG_BUILD_FLAGS:=no-mips16

GO_PKG:=github.com/juicity/juicity
GO_PKG_BUILD_PKG:=$(GO_PKG)/main
GO_PKG_LDFLAGS:=-trimpath -modcacherw
GO_PKG_LDFLAGS_X = \

GO_PKG_TARGET_VARS:=$(filter-out CGO_ENABLED=%,$(GO_PKG_TARGET_VARS)) CGO_ENABLED=0

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/bpf.mk
include $(TOPDIR)/feeds/packages/lang/golang/golang-package.mk

define Package/juicity
  SECTION:=net
  CATEGORY:=Network
  TITLE:=uicity is a quic-based proxy protocol implementation
  URL:=https://github.com/juicity/juicity
  DEPENDS:=$(GO_ARCH_DEPENDS) +ca-bundle
endef

define Package/juicity/description
  Juicity is a quic-based proxy protocol and implementation, inspired
  by tuic.
endef

define Package/juicity/install
	$(call GoPackage/Package/Install/Bin,$(PKG_INSTALL_DIR))

	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin $(1)/usr/bin/juicity
endef

$(eval $(call GoBinPackage,juicity))
$(eval $(call BuildPackage,juicity))
