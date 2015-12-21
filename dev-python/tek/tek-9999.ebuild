# Copyright 2013 gentoo64.net
# Distributed under the terms of the GNU General Public License v3
# $Header: $

EAPI=5
PYTHON_COMPAT=( python3_{3,4,5} )
EGIT_REPO_URI="https://gitlab.ternarypulsar.com/python/tek.git"

inherit git-r3 distutils-r1

HOMEPAGE=""
DESCRIPTION="common library for tek's python stuff"
RESTRICT="mirror"
LICENSE="GPL-3"
SLOT="3"
KEYWORDS="~amd64 ~x86"
IUSE=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/crystalmethod[${PYTHON_USEDEP}]
		 dev-python/requests[${PYTHON_USEDEP}]"
