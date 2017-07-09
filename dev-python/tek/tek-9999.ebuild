EAPI=6
PYTHON_COMPAT=( python3_{5,6} )
EGIT_REPO_URI="https://gitlab.tryp.io/python/tek.git"

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
		 dev-python/requests[${PYTHON_USEDEP}]
		 dev-python/golgi[${PYTHON_USEDEP}]
		 "
