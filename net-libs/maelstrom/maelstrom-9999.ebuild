# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="EFL based C networking libraries"
HOMEPAGE="https://git.enlightenment.org/devs/discomfitor/maelstrom.git/"
EGIT_REPO_URI="git://git.enlightenment.org/devs/discomfitor/maelstrom.git"

LICENSE="LGPL-2.1 BSD-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+azy +email +shotgun"

DEPEND="=dev-libs/efl-9999
		azy? ( virtual/yacc
			dev-util/re2c )"
RDEPEND="${DEPEND}"

src_prepare() {
	./autogen.sh || die "autogen failed"
}

src_configure() {
	local myconf="
		$(use_enable azy)
		$(use_enable email)
		$(use_enable shotgun)
		--disable-sawedoff
		--disable-shotgun-gui
		--disable-mysql-tests
	"

	econf ${myconf} || die "configure failed"
}
