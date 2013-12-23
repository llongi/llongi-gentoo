# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

NEED_PYTHON=2.3

inherit distutils

MY_PN="select26"
MY_P="${MY_PN}-${PV/_alpha/a}"

KEYWORDS="~amd64 ~x86"

DESCRIPTION="Backport of the Python 2.6 select module (epoll and kqueue support)."
HOMEPAGE="http://docs.python.org/dev/library/select.html"
SRC_URI="http://cheeseshop.python.org/packages/source/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="PYTHON"
SLOT="0"
IUSE=""

RDEPEND="!>=dev-lang/python-2.6"

DEPEND="${RDEPEND}
		dev-python/setuptools"

S="${WORKDIR}/${MY_P}"
