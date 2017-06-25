EAPI=6
PYTHON_COMPAT=( python3_{5,6} )
EGIT_REPO_URI="https://github.com/tek/crystalmethod.git"

inherit git-r3 distutils-r1

DESCRIPTION="A simple python multidispatch"
HOMEPAGE="https://github.com/tek/crystalmethod.git"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
