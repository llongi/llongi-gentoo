# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

ESVN_REPO_URI="svn://dev.longitekk.com/rig/atomic_ops/"

inherit subversion

KEYWORDS="~amd64 ~x86 ~arm"

DESCRIPTION="Headers for atomic operations on a wide variety of architectures."
HOMEPAGE="https://dev.longitekk.com/Rig/"
LICENSE="BSD-2"
SLOT="0"
IUSE="test"

DEPEND="test? ( dev-libs/check )"
RDEPEND=""

src_install() {
	insinto /usr/include
	doins "${PN}.h"
	doins -r "${PN}/"
}

src_test() {
	$(tc-getCC) ${LDFLAGS} ${CFLAGS} -std=c99 -Wall -pedantic ${PN}_test.c -o ${PN}_test -lcheck
	./${PN}_test
}
