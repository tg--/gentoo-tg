# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="4"
ETYPE="sources"

inherit kernel-2
detect_version

GRSEC_VERSION="2.9"
GRSEC_DATE="201203022148"
GRSEC_URI="http://grsecurity.net/test/grsecurity-${GRSEC_VERSION}-${PV}-${GRSEC_DATE}.patch"

CCS_VERSION="1.8.3"
CCS_DATE="20120301"

SRC_URI="${KERNEL_URI} ${ARCH_URI} ${GRSEC_URI}
		 mirror://sourceforge.jp/tomoyo/49684/ccs-patch-${CCS_VERSION}-${CCS_DATE}.tar.gz"

DESCRIPTION="tg (Tomoyo+Grsec) kernel sources (kernel series ${KV_MAJOR}.${KV_MINOR})"
HOMEPAGE="https://gitorious.org/tg/gentoo-tg/"
IUSE=""

KEYWORDS="~amd64"

src_unpack () {
	kernel-2_src_unpack
	unpack "ccs-patch-${CCS_VERSION}-${CCS_DATE}.tar.gz"
}

src_prepare () {
	epatch "${DISTDIR}/grsecurity-${GRSEC_VERSION}-${PV}-${GRSEC_DATE}.patch"

	# work around ccs not applying after grsec patch (upstream only provides
	# grsec-capable patches very infrequently)
	CCS_PATCH="${WORKDIR}/linux-${KV_FULL}/patches/ccs-patch-${KV_MAJOR}.${KV_MINOR}.diff"
	sed -i '/<linux\/bsearch.h>/a\ #include <linux\/grsecurity.h>' ${CCS_PATCH}
	epatch ${CCS_PATCH}
}

pkg_postinst() {
	kernel-2_pkg_postinst

	local GRADM_COMPAT="sys-apps/gradm-${GRSEC_VERSION}*"
	local TOMO_COMPAT="sys-apps/ccs-tools-${CCS_VERSION}*"

	ewarn "Users of grsecurity's RBAC system must ensure they are using"
	ewarn "${GRADM_COMPAT}, which is compatible with ${PF}."
	ewarn "It is strongly recommended that the following command is issued"
	ewarn "prior to booting a ${PF} kernel for the first time:"
	ewarn
	ewarn "emerge -na =${GRADM_COMPAT}"
	ewarn
	ewarn "tg sources use the tomoyo 1.8 branch, in contrast to 2.x, mainline"
	ewarn "uses. Despite the lower number this is the 'main' version with"
	ewarn "most features."
	ewarn "Make sure to use ${TOMO_COMPAT} instead of sys-apps/tomoyo-tools."
	ewarn
	ewarn "emerge -na =${TOMO_COMPAT}"
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
