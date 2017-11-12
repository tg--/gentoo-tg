# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="Simple static web gallery generator"
HOMEPAGE="http://sigal.saimon.org/"
SRC_URI="https://github.com/saimn/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-python/blinker
		dev-python/click
		dev-python/jinja
		dev-python/markdown
		dev-python/pillow
		dev-python/pilkit"
RDEPEND="${DEPEND}"
