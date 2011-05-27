# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="libmatroska alternative written in C"
HOMEPAGE="https://github.com/saintdev/libmkv"
SRC_URI="https://github.com/saintdev/libmkv/tarball/0.6.4.2 -> ${P}.tar.gz"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
				# Horrible workaround because github produces horrible tarballs.
				tar --strip-components 1 -xf ${DISTDIR}/${A} || die "Unpack failed"
}

src_prepare() {
				./bootstrap.sh || die "Bootstrap failed"
}

src_install() {
				emake DESTDIR="${D}" install || die "Install failed"
}
