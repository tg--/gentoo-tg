# Copyright 2013 gentoo64.net
# Distributed under the terms of the GNU General Public License v3
# $Header: $

EAPI=5
PYTHON_COMPAT=( python3_{3,4,5} )

inherit git-r3 distutils-r1

EGIT_REPO_URI="https://gitlab.ternarypulsar.com/python/series.git"

HOMEPAGE="https://gitlab.ternarypulsar.com/python/series"
DESCRIPTION="Series Management Tool"
RESTRICT="mirror"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="app-misc/tek-utils[${PYTHON_USEDEP}]
		 dev-python/feedparser[${PYTHON_USEDEP}]
		 dev-python/sqlpharmacy[${PYTHON_USEDEP}]
		 dev-python/lxml[${PYTHON_USEDEP}]
		 dev-python/factory_boy[${PYTHON_USEDEP}]
		 dev-python/alembic[${PYTHON_USEDEP}]
		 dev-python/flask[${PYTHON_USEDEP}]
		 dev-python/tpb[${PYTHON_USEDEP}]
		 dev-python/tvrampage[${PYTHON_USEDEP}]
		 dev-python/python-dateutil[${PYTHON_USEDEP}]
		 "
