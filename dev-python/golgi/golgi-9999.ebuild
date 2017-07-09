EAPI=6
PYTHON_COMPAT=( python3_{5,6} )
EGIT_REPO_URI="https://gitlab.tryp.io/python/golgi.git"

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
