# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

KEYWORDS="-* ~amd64 ~x86"

MY_PV="v1.84_091103"

DESCRIPTION="Areca RaidCard HTTPd for amd64 and x86."
HOMEPAGE="http://www.areca.com.tw/support/main.htm"
SRC_URI="ftp://ftp.areca.com.tw/RaidCards/AP_Drivers/Linux/HTTP/${MY_PV}.zip"
LICENSE="areca"
SLOT="0"
IUSE=""
RESTRICT="strip"

S="${WORKDIR}/${MY_PV/v/V}"

DEPEND="app-arch/unzip"
RDEPEND=""

src_install() {
	if use amd64 ; then
		newsbin "x86-64/archttp64" "${PN}"
	elif use x86 ; then
		newsbin "i386/archttp32" "${PN}"
	else
		eerror "Invalid ARCH, there are no Areca tools for you!"
	fi

	newinitd "${FILESDIR}/${PN}-initd" "${PN}"
}
