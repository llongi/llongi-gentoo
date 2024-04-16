# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module shell-completion systemd

DESCRIPTION="A simple daemon providing dynamic fan speed control"
SRC_URI="https://github.com/markusressel/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
HOMEPAGE="https://github.com/markusressel/fan2go"

LICENSE="AGPL-3 Apache-2.0 MIT BSD BSD-2 MIT MPL-2.0"
SLOT="0"
KEYWORDS="amd64"

DEPEND="sys-apps/lm-sensors"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	unpack ${FILESDIR}/${P}-deps.tar.xz
}

src_compile() {
	emake GO_FLAGS="-mod=vendor" build

	./fan2go completion bash > "${PN}.bash" || die
	./fan2go completion zsh  > "${PN}.zsh"  || die
}

src_install() {
	dobin fan2go
	dodoc README.md
	systemd_dounit "${PN}.service"
	insinto "/etc/${PN}"
	doins "${PN}.yaml"
	newbashcomp "${PN}.bash" "${PN}"
	newzshcomp "${PN}.zsh" "_${PN}"
}
