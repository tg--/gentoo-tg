EAPI=6
PYTHON_COMPAT=( python3_{5,6} )
EGIT_REPO_URI="https://github.com/ingolemo/python-lenses.git"

inherit git-r3 distutils-r1

HOMEPAGE=""
DESCRIPTION="python lenses"
RESTRICT="mirror"
LICENSE="GPL3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
DEPEND="dev-python/typing dev-python/pytest-runner"
RDEPEND=""
