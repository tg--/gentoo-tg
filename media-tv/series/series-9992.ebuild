# Copyright 2013 gentoo64.net
# Distributed under the terms of the GNU General Public License v3
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )

inherit git-r3 distutils-r1

EGIT_REPO_URI="git://gentoo64.net/series.git"
EGIT_BRANCH="python2"
HOMEPAGE=""
DESCRIPTION=""
RESTRICT="mirror"
LICENSE="GPL-3"
SLOT="2"
KEYWORDS="amd64 x86"
DEPEND="dev-python/setuptools"
IUSE="dbus"

RDEPEND="app-misc/tek-utils
		 dev-python/feedparser[${PYTHON_USEDEP}]
		 dev-python/quick_orm
		 dev-python/lxml[${PYTHON_USEDEP}]
		 dbus? ( dev-python/txdbus[${PYTHON_USEDEP}] )"
