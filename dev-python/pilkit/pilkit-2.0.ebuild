# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 python3_{3,4,5} )

inherit distutils-r1

DESCRIPTION="A collection of utilities and processors for the Python Imaging Libary"
HOMEPAGE="https://github.com/matthewwithanm/pilkit"
SRC_URI="https://github.com/matthewwithanm/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-python/pillow"
RDEPEND="${DEPEND}"

src_prepare() {
	default

	# remove tests to avoid collisions
	rm -rf tests/ || die "Couldn't remove tests!"
}
