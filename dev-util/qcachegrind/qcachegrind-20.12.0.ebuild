# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop gnome2-utils qmake-utils xdg-utils

# from kde5.eclass _calculate_src_uri
SRC_URI="mirror://kde/stable/applications/${PV}/src/kcachegrind-${PV}.tar.xz"

DESCRIPTION="Qt frontend for Cachegrind"
HOMEPAGE="https://apps.kde.org/en/kcachegrind"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# dbus might be optional
RDEPEND="dev-qt/qtcore:5
	dev-qt/qtdbus:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5"

DEPEND="app-arch/xz-utils ${RDEPEND}"

S="${WORKDIR}/kcachegrind-${PV}"

src_configure() {
	eqmake5
}

src_install() {
	local size
	dobin qcachegrind/qcachegrind
	domenu qcachegrind/qcachegrind.desktop
	for size in 32 48 64 128; do
		newicon -s ${size} kcachegrind/${size}-apps-kcachegrind.png qcachegrind.png
	done
}

pkg_postinst() {
	xdg_desktop_database_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	gnome2_icon_cache_update
}
