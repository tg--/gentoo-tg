# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit font versionator

MY_DATE=$(get_version_component_range 4)
MY_PV=$(get_version_component_range 1-3)_${MY_DATE:0:4}_${MY_DATE:4:2}_${MY_DATE:6}
MY_P_OTF="LinLibertineOTF_${MY_PV}"
MY_P_TTF="LinLibertineTTF_${MY_PV}"

DESCRIPTION="Fonts from the Linux Libertine Open Fonts Project, in OpenType of TrueType format"
HOMEPAGE="http://www.linuxlibertine.org/"
SRC_URI="(
	opentype? ( mirror://sourceforge/linuxlibertine/${MY_P_OTF}.tgz )
	truetype? ( mirror://sourceforge/linuxlibertine/${MY_P_TTF}.tgz ) )"

LICENSE="|| ( GPL-3-with-font-exception OFL )"
SLOT="0"
KEYWORDS="alpha amd64 ~arm ia64 ppc ~ppc64 sparc x86"
IUSE="opentype truetype"

DEPEND=""
RDEPEND="!<x11-libs/pango-1.20.4"
REQUIRED_USE="|| ( opentype truetype )"

S="${WORKDIR}"
FONT_S="${S}"
DOCS="Bugs.txt ChangeLog.txt README"

FONT_SUFFIX=""
if use opentype ; then
	FONT_SUFFIX="${FONT_SUFFIX} otf"
fi
if use truetype ; then
	 FONT_SUFFIX="${FONT_SUFFIX} ttf"
fi
