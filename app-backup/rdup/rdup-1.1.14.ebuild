# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils

DESCRIPTION="Generate a file list suitable for full or incremental backups."
HOMEPAGE="https://github.com/miekg/${PN}"
SRC_URI="https://github.com/miekg/${PN}/archive/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug test"

RDEPEND="app-arch/libarchive
		dev-libs/glib:2
		dev-libs/libpcre
		dev-libs/nettle"
DEPEND="${RDEPEND}
		test? ( dev-util/dejagnu )"

src_prepare() {
	epatch "${FILESDIR}/${PN}-revert-strip.patch"
	epatch "${FILESDIR}/${PN}-libarchive-3-support.patch"
}

src_configure() {
	econf $(use_enable debug)
}

src_test() {
	if use debug ; then
		ewarn "Test phase skipped, as it is known to fail with USE='debug'."
	else
		default_src_test
	fi
}
