# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils desktop

EXEC_NAME=vscode

DESCRIPTION="Multiplatform Visual Studio Code from Microsoft"
HOMEPAGE="https://code.visualstudio.com/"
SRC_URI="https://vscode-update.azurewebsites.net/${PV}/linux-x64/stable -> ${P}-amd64.tar.gz"
RESTRICT="mirror strip bindist"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=x11-libs/gtk+-3.24.22:3
	>=x11-libs/gtk+-2.24.32-r1:2
	>=dev-libs/atk-2.36.0
	>=dev-libs/glib-2.64.5
	>=x11-libs/gdk-pixbuf-2.40.0
	>=x11-libs/pango-1.42.4-r2
	>=x11-libs/cairo-1.16.0-r4
	>=media-libs/freetype-2.10.4
	>=media-libs/fontconfig-2.13.1-r2
	>=sys-apps/dbus-1.12.18
	>=x11-libs/libXi-1.7.10
	>=x11-libs/libXcursor-1.2.0
	>=x11-libs/libXdamage-1.1.5
	>=x11-libs/libXrandr-1.5.2
	>=x11-libs/libXcomposite-0.4.5
	>=x11-libs/libXext-1.3.4
	>=x11-libs/libXfixes-5.0.3-r2
	>=x11-libs/libXrender-0.9.10-r2
	>=x11-libs/libX11-1.6.12
	>=x11-libs/libXScrnSaver-1.2.3
	>=x11-libs/libXtst-1.2.3-r1
	>=x11-libs/libxcb-1.14
	>=x11-libs/libxkbfile-1.1.0
	>=media-libs/mesa-20.1.10[gbm]
	>=app-crypt/libsecret-0.20.3[crypt]
	>=dev-libs/nss-3.58-r2
	>=dev-libs/nspr-4.29
	>=media-libs/alsa-lib-1.2.3.2-r1
	>=net-print/cups-2.3.3-r1
	>=dev-libs/expat-2.2.8
	>=media-libs/libpng-1.6.37"

RDEPEND="${DEPEND}"

QA_PRESTRIPPED="opt/${PN}/code"
QA_PREBUILT="opt/${PN}/code"

S="${WORKDIR}/VSCode-linux-x64"

src_install() {
	dodir "/opt"

	# Using doins -r would strip executable bits from all binaries
	cp -pPR "${S}" "${D}/opt/${PN}" || die "Failed to copy files"
	dosym "${EPREFIX}/opt/${PN}/bin/code" "/usr/bin/${EXEC_NAME}"
	make_desktop_entry "${EXEC_NAME}" "Visual Studio Code" "${PN}" "Development;IDE"
	newicon "${S}/resources/app/resources/linux/code.png" "${PN}.png"
}
