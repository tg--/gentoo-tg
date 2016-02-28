# Copyright 2011 Torsten Schmits <tek@gentoo64.net>
# Distributed under the terms of the GNU General Public License v3
# $Header: $

inherit git-r3

EGIT_REPO_URI="https://gitlab.ternarypulsar.com/system/cfg-update.git"
DESCRIPTION="Easy to use GUI & CLI alternative for etc-update with safe automatic updating functionality"
HOMEPAGE="http://people.zeelandnet.nl/xentric/"
LICENSE="GPL-2"
SLOT="0"
IUSE="kde gnome"
KEYWORDS="amd64 ~arm ppc sparc x86"
RDEPEND="kde? ( >=x11-misc/sux-1.0
		x11-apps/xhost )
	gnome? ( >=x11-misc/sux-1.0
		x11-apps/xhost
		>=dev-util/meld-0.9 )
		dev-perl/TermReadKey
		"

S=${WORKDIR}/${PF}

pkg_prerm() {
	if [[ ${ROOT} == / ]]
	then
		ebegin "Disabling portage hook"
		cfg-update --ebuild --disable-portage-hook
		eend $?
		ebegin "Disabling paludis hook"
		cfg-update --ebuild --disable-paludis-hook
		eend $?
	fi
}

pkg_postrm() {
	ewarn
	ewarn "If you want to permanently remove cfg-update from your system"
	ewarn "you should manually remove the alias for emerge from /root/.bashrc"
	ewarn "followed by running: unalias emerge"
	ewarn "and remove the index file /var/lib/cfg-update/checksum.index"
	ewarn
	ewarn "If you are just updating to a newer version you should read the"
	ewarn "installation instructions on http://people.zeelandnet.nl/xentric"
	ewarn
}

src_install() {
	exeinto /usr/bin
	doexe cfg-update emerge_with_indexing_for_cfg-update emerge_with_indexing_for_cfg-update_phphelper cfg-update_phphelper emerge_with_indexing_for_cfg-update_bashhelper
	insinto /usr/lib/cfg-update
	doins cfg-update cfg-update_indexing .bashrc test.tgz
	dodoc ChangeLog
	doman *.8
	insinto /etc
	doins cfg-update.conf
	doins cfg-update.hosts
	keepdir /var/lib/cfg-update
}

pkg_postinst() {
	if [[ ! -e "${ROOT}"/var/lib/cfg-update/checksum.index \
		&& -e "${ROOT}"/var/lib/cfg-update/checksum.index ]]
	then
		ebegin "Moving checksum.index from /usr/lib/cfg-update to /var/lib/cfg-update"
		mv "${ROOT}"/usr/lib/cfg-update/checksum.index \
			"${ROOT}"/var/lib/cfg-update/checksum.index
		eend $?
	fi

	if [[ -e "${ROOT}"/usr/bin/paludis ]]
	then
		ewarn
		ewarn "If you have used Paludis version <0.20.0 on your system, chances are"
		ewarn "that you have some corrupted CONTENTS files on your system..."
		ewarn
		ewarn "Please run: cfg-update --check-packages"
		ewarn
		ewarn "The above command will check all packages installed with Paludis and"
		ewarn "will output a list of packages that need to be re-installed with"
		ewarn "Paludis 0.20.0 or higher. If you do not re-install these packages"
		ewarn "you risk losing your custom settings when updating configuration"
		ewarn "files, that belong to these packages, with cfg-update!"
		ewarn
	fi

	if [[ ${ROOT} == / ]]
	then
		ebegin "Moving backups to /var/lib/cfg-update/backups"
		/usr/bin/cfg-update --ebuild --move-backups
		eend $?
	fi

	einfo
	einfo "If this is a first time install, please check the configuration"
	einfo "in /etc/cfg-update.conf before using cfg-update:"
	einfo
	einfo "If your system does not have an X-server installed you need to"
	einfo "change the MERGE_TOOL to sdiff, imediff2 or vimdiff."
	einfo "If you have X installed, set MERGE_TOOL to your favorite GUI tool:"
	einfo "xxdiff (default), kdiff3, meld, gtkdiff, gvimdiff, tkdiff"
	einfo
	einfo "TIP: to maximize the chances of future automatic updates, run:"
	einfo "cfg-update --optimize-backups"
	einfo
	einfo "For an example of an updating session with screenshots visit:"
	einfo "http://people.zeelandnet.nl/xentric"
	einfo
}
