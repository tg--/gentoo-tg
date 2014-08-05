# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_3,3_4} )

inherit distutils-r1

DESCRIPTION="Various utilities for working with date and datetime objects"
HOMEPAGE="http://pypi.python.org/pypi/dateutils"
SRC_URI="mirror://pypi/d/dateutils/dateutils-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=""
DEPEND=""

python_prepare_all () {
	# workaround for obsolete argparse dependency
	#epatch ${FILESDIR}/dont-require-argparse.patch
	sed -i '/argparse/d' ${P}/${PN}.egg-info/requires.txt

	distutils-r1_python_prepare_all
}