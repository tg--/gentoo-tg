# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2

DESCRIPTION="Collection is a web-based front-end for collectd"
HOMEPAGE="http://octo.it/c4/"
EGIT_REPO_URI="git://git.verplant.org/collection4.git"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-libs/fcgi
		net-analyzer/rrdtool
		<dev-libs/yajl-2.0.0"

RDEPEND="${DEPEND}"

WANT_AUTOMAKE=1.11

src_prepare() {
		epatch ${FILESDIR}/9999-fix-build-with-recent-automake-versions.patch
		epatch ${FILESDIR}/9999-ran-autoupdate-to-fix-autoconf-warnings.patch
		./autogen.sh || die "Bootstrap failed."
}
