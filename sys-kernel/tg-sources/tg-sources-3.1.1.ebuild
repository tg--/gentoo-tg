# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-kernel/hardened-sources/hardened-sources-3.0.4-r2.ebuild,v 1.1 2011/09/15 22:16:19 blueness Exp $

EAPI="4"
ETYPE="sources"

inherit kernel-2
detect_version

GRSEC_VERSION="2.2.2"
GRSEC_DATE="201111201943"
GRSEC_URI="http://grsecurity.net/test/grsecurity-${GRSEC_VERSION}-${PV}-${GRSEC_DATE}.patch"

CCS_VERSION="1.8.3"

SRC_URI="${KERNEL_URI} ${ARCH_URI} ${GRSEC_URI}"

DESCRIPTION="tg (Tomoyo+Grsec) kernel sources (kernel series ${KV_MAJOR}.${KV_MINOR})"
HOMEPAGE="https://gitorious.org/tg/gentoo-tg/"
IUSE=""

KEYWORDS="~amd64"

src_prepare () {
	epatch "${DISTDIR}/grsecurity-${GRSEC_VERSION}-${PV}-${GRSEC_DATE}.patch"
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
