EAPI=5
PYTHON_COMPAT=( python3_{4,5} )

inherit distutils-r1

DESCRIPTION="cloudflare bypasser"
HOMEPAGE="https://github.com/Anorov/cloudflare-scrape"
SRC_URI="mirror://pypi/c/cfscrape/cfscrape-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/Js2Py dev-python/requests"
RDEPEND="${DEPEND}"
