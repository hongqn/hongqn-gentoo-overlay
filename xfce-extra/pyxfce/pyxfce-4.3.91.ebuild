# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Xfce4 python bindings"
HOMEPAGE="http://pyxfce.xfce.org/"
SRC_URI="http://pyxfce.xfce.org/${P}.tar.gz"
LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RDEPEND=">=x11-libs/gtk+-2.4
	>=xfce-base/libxfce4util-4.1.0
	>=xfce-base/libxfcegui4-4.3.90
	>=xfce-base/libxfce4mcs-4.1.0
	>=xfce-base/xfce-mcs-manager-4.1.0
	>=dev-python/pygtk-2.6.0"

src_install() {
	einstall || die "einstall failed"
	dodoc AUTHORS ChangeLog README TODO
}
