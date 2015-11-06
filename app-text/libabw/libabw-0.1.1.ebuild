# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit base eutils

DESCRIPTION="Library parsing abiword documents"
HOMEPAGE="https://wiki.documentfoundation.org/DLP/Libraries/${PN}"
SRC_URI="http://dev-www.libreoffice.org/src/${PN}/${P}.tar.xz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64 ~arm x86"
IUSE="doc static-libs"

RDEPEND="
	dev-libs/librevenge
	dev-libs/libxml2
	sys-libs/zlib
"
DEPEND="${RDEPEND}
	>=dev-libs/boost-1.46
	sys-devel/libtool
	virtual/pkgconfig
	doc? ( app-doc/doxygen )
"

src_configure() {
	export CPPFLAGS='-DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED'
	econf \
		--docdir="${EPREFIX}/usr/share/doc/${PF}" \
		--disable-werror \
		$(use_enable static-libs static) \
		$(use_with doc docs)
}

src_install() {
	default
	prune_libtool_files --all
}
