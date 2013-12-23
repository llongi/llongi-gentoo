# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ESVN_REPO_URI="svn://furie.ath.cx/repos/trunk/${PN}"

NEED_PYTHON=2.3

inherit distutils subversion

KEYWORDS="~amd64 ~x86"

DESCRIPTION="A Python module to pass fds and messages. Sendfile() support and others."
HOMEPAGE="http://chtekk.longitekk.com/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND=""

S="${WORKDIR}/${PN}"
