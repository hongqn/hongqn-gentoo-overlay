# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="NVIDIA X11 configuration tool"
HOMEPAGE="http://www.nvidia.com/"
SRC_URI="http://download.nvidia.com/XFree86/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${P}-respectflags.patch
}

src_install() {
	dobin ${PN} || die "dobin failed"
	doman ${PN}.1
}
