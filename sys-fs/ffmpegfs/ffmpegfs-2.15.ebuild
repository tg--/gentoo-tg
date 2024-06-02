# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="FUSE-based media transcoding filesystem"
HOMEPAGE="https://nschlia.github.io/ffmpegfs/html/index.html"
SRC_URI="https://github.com/nschlia/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="bluray doc dvd"

CDEPEND="
	app-text/asciidoc
	bluray? ( media-libs/libbluray )
	dvd? (
		media-libs/libdvdread
		media-libs/libdvdnav
	)
	dev-db/sqlite:3
	dev-libs/libchardet
	media-libs/libcue
	media-video/ffmpeg
	sys-fs/fuse:*
	www-client/w3m"

DEPEND="${CDEPEND}
	doc? (
		app-doc/doxygen[dot]
		net-misc/curl
	)"

RDEPEND="${CDEPEND}"

src_prepare() {
	./autogen.sh || die
	default
}

src_compile() {
	default
	use doc && emake doxy
}

src_install() {
	export CACHEDIR=/dev/null
	default
	use doc && dodoc -r doxygen/html
}
