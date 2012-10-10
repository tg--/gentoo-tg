# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="systemd user session unit files"
HOMEPAGE="http://github.com/sofar/user-session-units"
SRC_URI="http://foo-projects.org/~sofar/${PN}/${P}.tar.gz"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="sys-apps/systemd
		sys-apps/xorg-launch-helper"
RDEPEND="${DEPEND}"

