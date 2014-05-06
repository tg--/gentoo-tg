# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit cmake-utils git-2

DESCRIPTION="${PN} is a commandline frontend for thetvdb.com"
HOMEPAGE="http://etvdb.gstaedtner.net"
EGIT_REPO_URI="git://github.com/tg--/${PN}.git"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="|| ( dev-libs/efl
		( dev-libs/eina 
		dev-libs/ecore ) )
		media-tv/etvdb"
RDEPEND="${DEPEND}"
