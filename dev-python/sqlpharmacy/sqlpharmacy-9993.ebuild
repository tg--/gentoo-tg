# Copyright 2011 Torsten Schmits <tek@gentoo64.net>
# Distributed under the terms of the GNU General Public License v3

EAPI="5"
PYTHON_COMPAT=( python3_3 )

EGIT_REPO_URI="git://github.com/tek/sqlpharmacy.git"

inherit distutils-r1 git-r3

DESCRIPTION="python orm built on sqlalchemy"
HOMEPAGE="git://github.com/tek/sqlpharmacy.git"

LICENSE="BSD"
SLOT="3"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/sqlalchemy"
DEPEND=""
