EAPI=5
PYTHON_COMPAT=( python3_{3,4,5} )
EGIT_REPO_URI="https://gitlab.ternarypulsar.com/python/golgi.git"

inherit git-r3 distutils-r1

HOMEPAGE=""
DESCRIPTION="config, cli and terminal functionality"
RESTRICT="mirror"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/amino[${PYTHON_USEDEP}]"
