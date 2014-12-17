# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{3_3,3_4} )

inherit distutils-r1

DESCRIPTION="API for tvrage"
HOMEPAGE="http://pypi.python.org/pypi/tvrampage"
SRC_URI="mirror://pypi/t/tvrampage/tvrampage-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=">dev-python/beautifulsoup-4"
RDEPEND="${DEPEND}"
