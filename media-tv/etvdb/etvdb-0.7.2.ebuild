# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit cmake

DESCRIPTION="${PN} is a C library for thetvdb.com"
HOMEPAGE="http://etvdb.gstaedtner.net"
SRC_URI="https://github.com/tg--/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="|| ( dev-libs/efl dev-libs/eina )
	net-misc/curl"
RDEPEND="${DEPEND}"
