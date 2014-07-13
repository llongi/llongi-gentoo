# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

KEYWORDS="~amd64 ~x86"

DESCRIPTION="A static website compiler and blog engine, written and extended in Python."
HOMEPAGE="http://www.blogofile.com/"
SRC_URI="mirror://pypi/B/Blogofile/${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/mako
		dev-python/beautifulsoup:python-2
		dev-python/pytz
		dev-python/pyyaml
		app-text/pytextile
		dev-python/markdown[pygments]
		dev-python/docutils
		dev-python/pygments"

RESTRICT_PYTHON_ABIS="3.*"
