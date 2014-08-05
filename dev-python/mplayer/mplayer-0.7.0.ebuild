# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_3,3_4} )

inherit distutils-r1

DESCRIPTION="A versatile test fixtures replacement"
HOMEPAGE="http://pypi.python.org/pypi/mplayer.py/"
SRC_URI="mirror://pypi/m/mplayer.py/mplayer.py-${PV}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=""
DEPEND=""
S=$WORKDIR/$PN.py-$PV
