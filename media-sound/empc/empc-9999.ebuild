# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-r3

DESCRIPTION="MPD client with focus on speed-of-use and minimalism"
HOMEPAGE="https://git.enlightenment.org/apps/empc.git/"
EGIT_REPO_URI="git://git.enlightenment.org/apps/empc.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="+elyr glyr id3"

DEPEND=">=dev-libs/efl-1.12
		>=media-libs/elementary-1.12
		media-libs/libmpdclient
		net-libs/maelstrom[azy]
		glyr? ( media-libs/glyr )
		id3? ( media-libs/libid3tag )"
RDEPEND="${DEPEND}"

src_prepare() {
	./autogen.sh || die "autogen failed"
}

src_configure() {
	local myconf="
		$(use_enable elyr module-elyr)
		$(use_enable glyr module-glyr)
		$(use_enable id3 module-id3-loader)
	"
	
	econf ${myconf} || die "configure failed"
}
