# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit cmake-utils git-2

DESCRIPTION="${PN} is a C library and CLI frontend for thetvdb.com"
HOMEPAGE="http://etvdb.gstaedtner.net"
EGIT_REPO_URI="git://github.com/tg--/${PN}.git"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS=""
IUSE="debug"

DEPEND="|| ( dev-libs/efl dev-libs/eina )
	net-misc/curl"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
			$(cmake-utils_use debug DEBUG)
	)

	cmake-utils_src_configure
}
