# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ESVN_REPO_URI="svn://furie.ath.cx/repos/trunk/${PN}"

NEED_PYTHON=2.5
PYTHON_MODNAME="Furie"

inherit distutils subversion

KEYWORDS="~amd64 ~x86"

DESCRIPTION="HTTP/1.1-compliant handler module for Furie."
HOMEPAGE="http://chtekk.longitekk.com/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="www-servers/Furie
		>=dev-python/sqlobject-0.10.2
		dev-python/cgiws"

S="${WORKDIR}/${PN}"
