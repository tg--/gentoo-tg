# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Pluggable, composable, unopinionated modules for building a Wayland compositor."
HOMEPAGE="https://github.com/swaywm/wlroots"

SRC_URI="https://github.com/swaywm/wlroots/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="X elogind systemd xwayland"

RDEPEND="
	!systemd? ( sys-libs/libcap )
	!elogind? ( sys-libs/libcap )
	elogind? ( sys-auth/elogind )
	systemd? ( sys-apps/systemd )
	X? ( x11-libs/libxcb[xkb] )
	dev-libs/libinput
	media-libs/mesa[egl,gbm,gles2,wayland]
	virtual/libudev
	x11-libs/pixman
	x11-libs/libxkbcommon
"

DEPEND="${RDEPEND}"

src_configure() {
	local emesonargs=(
		$(meson_use X x11-backend)
		$(meson_use xwayland)
	)

	# use libcap only if no logind variant is used
	if use elogind; then
		emesonargs+=(-Dlogind=true)
		emesonargs+=(-Dlogind-provider=elogind)
	elif use systemd; then
		emesonargs+=(-Dlogind=true)
		emesonargs+=(-Dlogind-provider=systemd)
	else
		emesonargs+=(-Dlibcap=true)
	fi

	# disable examples for now
	emesonargs+=(-Drootston=false -Dexamples=false)
}
