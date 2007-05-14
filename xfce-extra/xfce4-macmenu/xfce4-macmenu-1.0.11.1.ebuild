# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

MY_PN=${PN}-plugin

DESCRIPTION="Mac-style menubar plugin for xfce panel (4.4+)"
HOMEPAGE="http://aquila.deus.googlepages.com/"
SRC_URI="http://aur.archlinux.org/packages/${MY_PN}/${MY_PN}.tar.gz"
KEYWORDS="~amd64 ~x86"
S=${WORKDIR}/${MY_PN}

DEPEND="xfce-base/xfce4-panel
	>=x11-libs/gtk+-2.10.6
	>=x11-libs/libwnck-2.16.1"

pkg_setup() {
	if ! built_with_use x11-libs/gtk+ macmenu; then
		built_with_use_error x11-libs/gtk+ macmenu
	fi
}

src_unpack() {
	unpack ${A}
	sed -i "s:/opt/xfce4:/usr:" "${S}/${MY_PN}.desktop" || die "sed failed"
}

src_compile() {
	gcc -std=c99 -Wall -Werror -fno-strict-aliasing -DFOR_XFCE `pkg-config --cflags --libs libwnck-1.0 libxfce4panel-1.0` $CFLAGS $LDFLAGS -o ${MY_PN} macmenu-applet.c || die "compile failed"
}

src_install() {
	exeinto /usr/libexec/xfce4/panel-plugins/
	doexe ${MY_PN}
	insinto /usr/share/xfce4/panel-plugins/
	doins ${MY_PN}.desktop
}
