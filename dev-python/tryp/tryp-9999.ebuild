EAPI=5
PYTHON_COMPAT=( python3_{3,4,5} )
EGIT_REPO_URI="https://github.com/tek/tryp.py.git"

inherit git-r3 distutils-r1

HOMEPAGE=""
DESCRIPTION="functional data structures"
RESTRICT="mirror"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/toolz[${PYTHON_USEDEP}]
		 dev-python/fn[${PYTHON_USEDEP}]
		 dev-python/lenses[${PYTHON_USEDEP}]
		 "
