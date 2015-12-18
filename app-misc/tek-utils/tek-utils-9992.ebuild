# Copyright 2011 moonitor.org
# Distributed under the terms of the GNU General Public License v3
# $Header: $

EAPI=5
PYTHON_COMPAT=( python3_{3,4,5} )

inherit git-r3 distutils-r1

EGIT_REPO_URI="git://moonitor.org/tek-utils.git"
EGIT_BRANCH="python2"
HOMEPAGE=""
DESCRIPTION="collection of utilities"
RESTRICT="mirror"
LICENSE="GPL-3"
SLOT="2"
KEYWORDS="amd64 x86"
IUSE="mail"
DEPEND="dev-python/setuptools"

RDEPEND="~dev-python/tek-9992
		 >dev-python/requests-1
		 dev-python/tpb
		 mail? ( net-mail/lbdb
				 dev-python/vobject )"
