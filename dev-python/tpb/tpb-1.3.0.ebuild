# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_3,3_4} )

inherit distutils-r1

DESCRIPTION="Unofficial Python API for ThePirateBay"
HOMEPAGE="http://pypi.python.org/pypi/ThePirateBay"
SRC_URI="mirror://pypi/T/ThePirateBay/ThePirateBay-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/cssselect
		dev-python/dateutils
		dev-python/purl"
RDEPEND="${DEPEND}"

S="${WORKDIR}/ThePirateBay-$PV"

src_prepare()
{
	sed -i "s/,'tests'//" "$S/setup.py"
}
