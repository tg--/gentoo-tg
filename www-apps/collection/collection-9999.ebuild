# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git

DESCRIPTION="Collection is a web-based front-end for collectd"
HOMEPAGE="http://octo.it/c4/"
EGIT_REPO_URI="git://git.verplant.org/collection4.git"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-libs/fcgi
		net-analyzer/rrdtool
		dev-libs/yajl"

RDEPEND="${DEPEND}"

src_prepare() {
		./autogen.sh || die "Bootstrap failed."
}
