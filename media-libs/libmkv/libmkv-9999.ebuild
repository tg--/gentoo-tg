# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit git

DESCRIPTION="libmatroska alternative written in C"
HOMEPAGE="http://repo.or.cz/w/libmkv.git"
EGIT_REPO_URI="git://repo.or.cz/libmkv.git"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
				./bootstrap.sh || die "Bootstrap failed"
}

src_install() {
				emake DESTDIR="${D}" install || die "Install failed"
}
