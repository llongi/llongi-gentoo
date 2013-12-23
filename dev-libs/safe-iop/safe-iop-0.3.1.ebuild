# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

KEYWORDS="~amd64 ~x86"

DESCRIPTION="Safe integer operations."
HOMEPAGE="http://code.google.com/p/${PN}/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tgz"
LICENSE="BSD"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND=""

src_compile() {
	einfo "Nothing to compile."
}

src_install() {
	insinto /usr/include
	doins include/safe_iop.h
}
