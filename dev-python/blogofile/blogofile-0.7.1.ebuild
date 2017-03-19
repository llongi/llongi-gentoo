# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

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
