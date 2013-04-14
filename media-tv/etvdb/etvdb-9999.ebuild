# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit cmake-utils git-2

DESCRIPTION="etvdb is a C library and CLI frontend for thetvdb.com"
HOMEPAGE="http://etvdb.gstaedtner.net"
EGIT_REPO_URI="git://github.com/tg--/etvdb.git"

LICENSE="LGPL-2.1+ GPL-3+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="|| ( dev-libs/efl
			( dev-libs/eina
		   	  dev-libs/ecore )
			)"
RDEPEND="${DEPEND}"
