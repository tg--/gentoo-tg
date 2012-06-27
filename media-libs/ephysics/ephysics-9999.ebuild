# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit enlightenment

DESCRIPTION="Wrapper to make the bullet physics engine useable in EFL"
HOMEPAGE="http://www.enlightenment.org/"

IUSE="test"

RDEPEND="
	>=dev-libs/ecore-9999[evas]
	>=media-libs/evas-9999
	>=sci-physics/bullet-2.80
	test? ( >=media-libs/elementary-9999 )"
DEPEND="${RDEPEND}"

src_configure() {
	if ! use test ; then
		MY_ECONF="--disable-build-tests"
	fi

	enlightenment_src_configure
}
