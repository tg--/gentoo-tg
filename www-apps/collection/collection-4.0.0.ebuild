# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Collection is a web-based front-end for collectd"
HOMEPAGE="http://octo.it/c4/"
SRC_URI="http://octo.it/c4/files/${P}.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-libs/fcgi
		net-analyzer/rrdtool
		dev-libs/yajl"

RDEPEND="${DEPEND}"
