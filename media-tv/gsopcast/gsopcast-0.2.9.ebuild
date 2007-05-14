# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="a gtk front-end of p2p TV sopcast"
HOMEPAGE="http://lianwei3.googlepages.com/home2"
SRC_URI="http://lianwei3.googlepages.com/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 ~amd64"
IUSE=""

DEPEND=">=media-tv/sp-sc-0.9.6
    net-misc/curl
    media-libs/alsa-lib
    >=x11-libs/gtk+-2"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${P}/src/

src_unpack() {
    unpack ${A} || die "Failed to unpack ${A}"
}

src_compile() {
    emake || die "emake failed"
}

src_install() {
    dobin gsopcast || die "dobin gsopcast failed"
} 
