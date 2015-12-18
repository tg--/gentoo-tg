# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python3_{3,4,5} )
EGIT_REPO_URI="git://github.com/karan/TPB.git"

inherit git-r3 distutils-r1

HOMEPAGE="http://pypi.python.org/pypi/ThePirateBay"
DESCRIPTION="Python API for ThePirateBay."

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/cssselect
		dev-python/dateutils
		dev-python/purl
		dev-python/pytz"
RDEPEND="${DEPEND}"

src_prepare()
{
	sed -i "s/, 'tests'//" "$S/setup.py"
}
