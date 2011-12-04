# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-kernel/hardened-sources/hardened-sources-3.0.4-r2.ebuild,v 1.1 2011/09/15 22:16:19 blueness Exp $

EAPI="4"
ETYPE="sources"

inherit kernel-2
detect_version

GRSEC_VERSION="2.2.2"
GRSEC_DATE="201112021740"
#GRSEC_URI="http://grsecurity.net/test/grsecurity-${GRSEC_VERSION}-${PV}-${GRSEC_DATE}.patch"

CCS_VERSION="1.8.3"
CCS_DATE="20111118"

HGPV="${KV_MAJOR}.${KV_MINOR}.${KV_PATCH}-1"
HGPV_URI="http://dev.gentoo.org/~blueness/hardened-sources/hardened-patches/hardened-patches-${HGPV}.extras.tar.bz2"

SRC_URI="${KERNEL_URI} ${HGPV_URI} ${GENPATCHES_URI} ${ARCH_URI} ${GRSEC_URI}
		 mirror://sourceforge.jp/tomoyo/49684/ccs-patch-${CCS_VERSION}-${CCS_DATE}.tar.gz"

UNIPATCH_LIST="${DISTDIR}/hardened-patches-${HGPV}.extras.tar.bz2"
UNIPATCH_EXCLUDE="4200_fbcondecor-0.9.6.patch "

DESCRIPTION="tg (Tomoyo+Grsec/Gentoo) kernel sources (kernel series ${KV_MAJOR}.${KV_MINOR})"
HOMEPAGE="https://gitorious.org/tg/gentoo-tg/"
IUSE=""

KEYWORDS="~amd64"

src_unpack () {
	kernel-2_src_unpack
	unpack "ccs-patch-${CCS_VERSION}-${CCS_DATE}.tar.gz"
}

src_prepare () {
	unipatch
	epatch "${FILESDIR}/ccs-patch-${PV}-grsecurity-${GRSEC_DATE}.diff"
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
