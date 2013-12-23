# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

ESVN_REPO_URI="svn://dev.longitekk.com/rig/trunk/"

inherit cmake-utils subversion

KEYWORDS="~amd64 ~x86 ~arm"

DESCRIPTION="Lock-free data-structures, safe buffers and other stuff for the C language."
HOMEPAGE="https://dev.longitekk.com/Rig/"
LICENSE="BSD-2"
SLOT="0"
IUSE="epoch +iterator test"

DEPEND="dev-libs/atomic_ops
		test? ( dev-libs/check )"
RDEPEND=""

src_configure() {
	subversion_wc_info

	mycmakeargs=(
		$(cmake-utils_use test RIG_TESTS_SUPPORT)
		$(cmake-utils_use iterator RIG_STACK_ITERATOR_SUPPORT)
		$(cmake-utils_use iterator RIG_QUEUE_ITERATOR_SUPPORT)
		-DPROJECT_REVISION="${ESVN_WC_REVISION}"
	)

	if use epoch ; then
		mycmakeargs+=(
			-DRIG_LIST_SMR_TYPE=2
			-DRIG_QUEUE_SMR_TYPE=2
			-DRIG_STACK_SMR_TYPE=2
		)
	fi

	cmake-utils_src_configure
}
