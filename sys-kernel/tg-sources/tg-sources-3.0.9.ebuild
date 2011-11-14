# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-kernel/hardened-sources/hardened-sources-3.0.4-r2.ebuild,v 1.1 2011/09/15 22:16:19 blueness Exp $

EAPI="4"

ETYPE="sources"
K_WANT_GENPATCHES="base extras"
K_GENPATCHES_VER="5"

inherit kernel-2
detect_version

HGPV="${KV_MAJOR}.${KV_MINOR}.${KV_PATCH}-1"
HGPV_URI="http://dev.gentoo.org/~blueness/hardened-sources/hardened-patches/hardened-patches-${HGPV}.extras.tar.bz2"
CCS_VERSION="1.8.3-20111111"
SRC_URI="${KERNEL_URI} ${HGPV_URI} ${GENPATCHES_URI} ${ARCH_URI}
		 mirror://sourceforge.jp/tomoyo/49684/ccs-patch-${CCS_VERSION}.tar.gz"

UNIPATCH_LIST="${DISTDIR}/hardened-patches-${HGPV}.extras.tar.bz2"
UNIPATCH_EXCLUDE="4200_fbcondecor-0.9.6.patch"

DESCRIPTION="tg (Tomoyo+Grsec/Gentoo) kernel sources (kernel series ${KV_MAJOR}.${KV_MINOR})"
HOMEPAGE="http://www.gentoo.org/proj/en/hardened/ https://gitorious.org/tg/gentoo-tg/"
IUSE=""

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"

src_prepare () {
	local CCS_PATCH="${WORKDIR}/linux-${KV_FULL}/patches/ccs-patch-${KV_MAJOR}.${KV_MINOR}.diff"

	# unpack here because we only need one patch, no need to rewrite src_unpack
	unpack "ccs-patch-${CCS_VERSION}.tar.gz"

	# workaround: make patch apply with existing gresc
	sed -i '/<linux\/bsearch.h>/a\ #include <linux\/grsecurity.h>' ${CCS_PATCH}

	EPATCH_OPTS="-p1 --no-backup-if-mismatch" epatch ${CCS_PATCH}
}

pkg_postinst() {
	kernel-2_pkg_postinst

	local GRADM_COMPAT="sys-apps/gradm-2.2.2*"
	local TOMO_COMPAT="sys-apps/ccs-tools-1.8.3*"

	ewarn
	ewarn "Hardened Gentoo provides three different predefined grsecurity level:"
	ewarn "[server], [workstation], and [virtualization]."
	ewarn
	ewarn "Those who intend to use one of these predefined grsecurity levels"
	ewarn "should read the help associated with the level.  Users importing a"
	ewarn "kernel configuration from a kernel prior to ${PN}-2.6.32,"
	ewarn "should review their selected grsecurity/PaX options carefully."
	ewarn
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
