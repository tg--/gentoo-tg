# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

DESCRIPTION="A ssh/gpg-agent wrapper leveraging cgroups and systemd/socket activation"
HOMEPAGE="https://github.com/vodik/envoy"
SRC_URI="https://github.com/vodik/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="sys-apps/dbus"
RDEPEND="${DEPEND}"
