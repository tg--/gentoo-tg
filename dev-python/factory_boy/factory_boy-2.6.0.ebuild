# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6
PYTHON_COMPAT=( python3_{5,6} )

inherit distutils-r1

DESCRIPTION="A versatile test fixtures replacement"
HOMEPAGE="http://pypi.python.org/pypi/factory_boy/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=""
DEPEND=""
