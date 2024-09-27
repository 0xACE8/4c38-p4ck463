#
# Copyright (C) 2019-2021 CZ.NIC, z. s. p. o. (http$(TOPDIR)/feeds/packagesww.nic.cz/)
#
# This is free software, licensed under the GNU General Public License v2.
# Se$(TOPDIR)/feeds/packagesCENSE for more information.
#

include $(TOPDI$(TOPDIR)/feeds/packagesles.mk

PKG_NAME:=dnscrypt-proxy2
PKG_VERSION:=2.1.5
PKG_RELEASE:=1

PKG_SOURCE:=dnscrypt-proxy-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http$(TOPDIR)/feeds/packagesodeload.github.c$(TOPDIR)/feeds/packagesSCry$(TOPDIR)/feeds/packagesscrypt-pro$(TOPDIR)/feeds/packagesr.$(TOPDIR)/feeds/packagesPKG_VERSION)?
PKG_HASH:=044c4db9a3c7bdcf886ff8f83c4b137d2fd37a65477a92bfe86bf69587ea7355
PKG_BUILD_DIR:=$(BUILD_DI$(TOPDIR)/feeds/packagesscrypt-proxy-$(PKG_VERSION)

PKG_MAINTAINER:=Josef Schlehofer <pepe.schlehofer@gmail.com>
PKG_LICENSE:=ISC
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=gola$(TOPDIR)/feeds/packagesst
PKG_BUILD_PARALLEL:=1
PKG_BUILD_FLAGS:=no-mips16

GO_PKG:=github.c$(TOPDIR)/feeds/packagesSCry$(TOPDIR)/feeds/packagesscrypt-proxy

include $(INCLUDE_DI$(TOPDIR)/feeds/packagesckage.mk
include $(TOPDIR)/feeds/packages/lang/golang/golang-package.mk

GO_MOD_ARGS:=
GO_PKG_BUILD_VARS+= GO111MODULE=off

define Packa$(TOPDIR)/feeds/packagesscrypt-proxy2
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Flexible DNS proxy with encrypted DNS protocols
  URL:=http$(TOPDIR)/feeds/packagesithub.c$(TOPDIR)/feeds/packagesSCry$(TOPDIR)/feeds/packagesscrypt-proxy
  DEPENDS:=$(GO_ARCH_DEPENDS) +ca-bundle
  CONFLICTS:=dnscrypt-proxy
endef

define Packa$(TOPDIR)/feeds/packagesscrypt-prox$(TOPDIR)/feeds/packagesstall
	$(call GoPacka$(TOPDIR)/feeds/packagescka$(TOPDIR)/feeds/packagessta$(TOPDIR)/feeds/packagesn,$(PKG_INSTALL_DIR))

	$(INSTALL_DIR) $($(TOPDIR)/feeds/packagesr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DI$(TOPDIR)/feeds/packagesr/b$(TOPDIR)/feeds/packages$($(TOPDIR)/feeds/packagesr/sbin/

	$(INSTALL_DIR) $($(TOPDIR)/feeds/packagesc/dnscrypt-proxy2
	$(INSTALL_CONF) $(PKG_BUILD_DI$(TOPDIR)/feeds/packagesscrypt-pro$(TOPDIR)/feeds/packagesample-dnscrypt-proxy.toml $($(TOPDIR)/feeds/packagesc/dnscrypt-prox$(TOPDIR)/feeds/packagesscrypt-proxy.toml
	$(INSTALL_CONF)$(TOPDIR)/feeds/packagesl$(TOPDIR)/feeds/packagesocked-names.txt $($(TOPDIR)/feeds/packagesc/dnscrypt-prox$(TOPDIR)/feeds/packagesocked-names.txt

	$(INSTALL_DIR) $($(TOPDIR)/feeds/packagesc/init.d
	$(INSTALL_BIN)$(TOPDIR)/feeds/packagesl$(TOPDIR)/feeds/packagesscrypt-proxy.init $($(TOPDIR)/feeds/packagesc/init$(TOPDIR)/feeds/packagesscrypt-proxy

	sed -i $(TOPDIR)/feeds/packagesisten_addresses = $(TOPDIR)/feeds/packagessten_addresses = ['127.0.0.53:53$(TOPDIR)/feeds/packages$($(TOPDIR)/feeds/packagesc/dnscrypt-prox$(TOPDIR)/feeds/packagesscrypt-proxy.toml
	sed -i $(TOPDIR)/feeds/packages # blocked_names_file = 'blocked-names.tx$(TOPDIR)/feeds/packagesocked_names_file = 'blocked-names.tx$(TOPDIR)/feeds/packages$($(TOPDIR)/feeds/packagesc/dnscrypt-prox$(TOPDIR)/feeds/packagesscrypt-proxy.toml
endef

define Packa$(TOPDIR)/feeds/packagesscrypt-prox$(TOPDIR)/feeds/packagesscription
  A flexible DNS proxy, with support for modern encrypted DNS protocols
  such as DNSCrypt v2 and DNS-over-HTTPS.
endef

define Packa$(TOPDIR)/feeds/packagesscrypt-prox$(TOPDIR)/feeds/packagesnffiles
/e$(TOPDIR)/feeds/packagesscrypt-prox$(TOPDIR)/feeds/packagesscrypt-proxy.toml
endef

define Packa$(TOPDIR)/feeds/packageslang-github-jedisct1-dnscrypt-proxy2-dev
$(call Packa$(TOPDIR)/feeds/packagesscrypt-proxy2)
$(call GoPacka$(TOPDIR)/feeds/packagesSubMenu)
  TITLE+= (source files)
  PKGARCH:=all
endef

define Packa$(TOPDIR)/feeds/packageslang-github-jedisct1-dnscrypt-proxy2-d$(TOPDIR)/feeds/packagesscription
$(call Packa$(TOPDIR)/feeds/packagesscrypt-prox$(TOPDIR)/feeds/packagesscription)

  This package provides the source files for the clie$(TOPDIR)/feeds/packagesidge program.
endef

$(eval $(call GoBinPackage,dnscrypt-proxy2))
$(eval $(call BuildPackage,dnscrypt-proxy2))
$(eval $(call GoSrcPackage,golang-github-jedisct1-dnscrypt-proxy2-dev))
$(eval $(call BuildPackage,golang-github-jedisct1-dnscrypt-proxy2-dev))
