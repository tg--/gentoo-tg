# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python3_{3,4,5} )
EGIT_REPO_URI="git://github.com/jaseg/python-mpv.git"

inherit git-r3 distutils-r1

HOMEPAGE=""
DESCRIPTION="Python interface to the awesome mpv media player"
RESTRICT="mirror"
LICENSE="AGPL"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""
