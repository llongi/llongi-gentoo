# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop qmake-utils xdg-utils

SRC_URI="https://invent.kde.org/sdk/kcachegrind/-/archive/v${PV}/kcachegrind-v${PV}.tar.gz -> ${P}.tar.gz"

DESCRIPTION="Qt frontend for Cachegrind"
HOMEPAGE="https://apps.kde.org/en/kcachegrind"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="${PYTHON_DEPS} dev-qt/qtbase:6[gui,opengl]"
DEPEND="${RDEPEND}"

S="${WORKDIR}/kcachegrind-${PV}"

src_configure() {
	eqmake6
}

src_install() {
	einstalldocs

	dobin qcachegrind/qcachegrind
	domenu qcachegrind/qcachegrind.desktop
	doicon kcachegrind/kcachegrind.svg
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}
