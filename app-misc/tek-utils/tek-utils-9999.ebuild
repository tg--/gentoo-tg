EAPI=6
PYTHON_COMPAT=( python3_{5,6} )

inherit git-r3 distutils-r1

EGIT_REPO_URI="https://gitlab.tryp.io/python/tek-utils.git"
HOMEPAGE=""
DESCRIPTION="collection of utilities"
RESTRICT="mirror"
LICENSE="GPL-3"
SLOT="3"
KEYWORDS="~amd64 ~x86"
IUSE="mail"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

RDEPEND="dev-python/tek[${PYTHON_USEDEP}]
		 >dev-python/requests-1[${PYTHON_USEDEP}]
		 dev-python/tpb[${PYTHON_USEDEP}]
		 dev-python/pyquery[${PYTHON_USEDEP}]
		 dev-python/cfscrape[${PYTHON_USEDEP}]
		 mail? ( net-mail/lbdb
				 dev-python/vobject )"
