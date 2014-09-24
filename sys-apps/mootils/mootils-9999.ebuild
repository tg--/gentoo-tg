# Copyright 2011 moonitor.org
# Distributed under the terms of the GNU General Public License v3
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit git-r3 distutils-r1

EGIT_REPO_URI="git://moonitor.org/mootils.git"
HOMEPAGE="http://moonitor.org"
DESCRIPTION="some package mask handling python tools using eix search"
RESTRICT="mirror"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="|| ( app-portage/eix sys-apps/paludis )
		 ~dev-python/tek-9992:2[${PYTHON_USEDEP}]"
