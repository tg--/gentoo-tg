# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="utility to transform the X server process into a daemon"
HOMEPAGE="http://github.com/sofar/xorg-launch-helper"
SRC_URI="http://foo-projects.org/~sofar/${PN}/${P}.tar.gz"

LICENSE="GPLv2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="sys-apps/systemd"
RDEPEND="${DEPEND}"

