# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="SopCast client version 0.9.6 library dependency"
HOMEPAGE="http://lianwei3.googlepages.com/home2"
SRC_URI="http://download.sopcast.org/download/sp-sc.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 ~amd64"
IUSE=""

DEPEND="sys-libs/libstdc++-v3"
RDEPEND="${DEPEND}"

S=${WORKDIR}/sp-sc/

src_unpack() {
    unpack ${A} || die "Failed to unpack ${A}"
}

src_install() {
    dobin sp-sc || die "dobin sp-sc failed"
} 
