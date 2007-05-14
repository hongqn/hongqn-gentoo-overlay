# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="a lightweight mind-mapping tool"
HOMEPAGE="http://www.gnome.org/~dscorgie/labyrinth.html"
SRC_URI="http://www.gnome.org/~dscorgie/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-lang/python-2.4
	>=x11-libs/gtk+-2.8
	>=dev-python/pygtk-2.8
	>=dev-python/pygobject-2.12
	>=dev-python/gnome-python-2.12
	>=gnome-base/gnome-desktop-2.14
	>=dev-python/pycairo-1.0"
RDEPEND=""

src_install() {
	einstall || die "einstall"
}
