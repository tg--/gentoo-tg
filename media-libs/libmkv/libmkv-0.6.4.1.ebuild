# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="libmatroska alternative written in C"
HOMEPAGE="http://repo.or.cz/w/libmkv.git"
SRC_URI="http://repo.or.cz/w/libmkv.git/snapshot/a80e593de2bcfabd4ad6ca0a5c6b4566e3732557.tar.gz
-> ${P}.tar.gz"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}/"

src_prepare() {
				./bootstrap.sh || die "Bootstrap failed"
}

src_install() {
				emake DESTDIR="${D}" install || die "Install failed"
}
