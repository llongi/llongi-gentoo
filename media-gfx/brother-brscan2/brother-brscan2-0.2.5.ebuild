# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit rpm

KEYWORDS="~amd64 ~x86"
DESCRIPTION="Brother brscan2 scanner driver."
HOMEPAGE="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
SRC_URI="amd64? ( http://www.brother.com/pub/bsc/linux/dlf/brscan2-${PV}-1.x86_64.rpm )
		 x86? ( http://www.brother.com/pub/bsc/linux/dlf/brscan2-${PV}-1.i386.rpm )"
LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND=">=media-gfx/sane-backends-1.0.19"

src_unpack() {
	rpm_src_unpack
}

src_compile() {
	echo "Nothing to compile."
}

src_install() {
	cp -Rf "./" "${D}/"
}

pkg_postinst() {
	${ROOT}usr/local/Brother/sane/setupSaneScan2 -i
}
