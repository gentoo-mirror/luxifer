# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="RSA SecurID-compatible software token for Linux/UNIX systems"
HOMEPAGE="http://stoken.sf.net"

SRC_URI="https://github.com/cernekee/stoken/archive/v0.90.tar.gz -> stoken-0.90.tar.gz"
LICENSE="LGPL-2.1+"

SLOT="0"

KEYWORDS="~x86 ~amd64"

IUSE="+gtk +nettle -tomcrypt"
REQUIRED_USE="^^ ( tomcrypt nettle )"

DEPEND="dev-libs/libxml2
	gtk? (
		x11-libs/gtk+:3
	)
	tomcrypt? (
		dev-libs/libtomcrypt
	)
	nettle? (
		dev-libs/nettle
	)
	"
RDEPEND="${DEPEND}"

src_configure() {
	./autogen.sh || die
	econf \
		$(use_with gtk) \
		$(use_with tomcrypt) \
		$(use_with nettle) \
		--without-java
}
