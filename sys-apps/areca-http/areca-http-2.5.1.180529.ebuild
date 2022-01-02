# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

KEYWORDS="-* ~amd64 ~x86"

MY_P="Linuxhttp_V2.5.1_180529"

DESCRIPTION="Areca RaidCard HTTPd for amd64 and x86."
HOMEPAGE="https://www.areca.com.tw/support/downloads.html"
SRC_URI="https://www.areca.us/support/s_linux/http/${MY_P}.zip"
LICENSE="areca"
SLOT="0"
IUSE=""
RESTRICT="strip"

S="${WORKDIR}/${MY_P}"

DEPEND="app-arch/unzip"
RDEPEND=""

src_install() {
	if use amd64 ; then
		newsbin "x86_64/archttp64" "${PN}"
	elif use x86 ; then
		newsbin "i386/archttp32" "${PN}"
	else
		eerror "Invalid architecture, no Areca tools available!"
	fi

	newinitd "${FILESDIR}/${PN}-initd" "${PN}"
}
