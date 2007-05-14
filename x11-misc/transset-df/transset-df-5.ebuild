# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/transset/transset-0.1_pre20040821.ebuild,v 1.5 2004/09/09 19:05:04 pauldv Exp $

inherit eutils

IUSE=""

DESCRIPTION="Patched version of transset for extra functionality"
HOMEPAGE="http://forchheimer.se/transset-df/"
SRC_URI="http://forchheimer.se/transset-df/${P}.tar.gz"

SLOT="0"
# *****************
# Double check license - no specific mention of one
LICENSE="BSD"
# ******************
KEYWORDS="~x86 ~ppc ~amd64"

DEPEND=">=x11-base/xorg-x11-6.7.99.902"

src_unpack() {
	unpack ${A}
	cd ${S}
	epatch ${FILESDIR}/transset-df-makefile.patch
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	into /usr
	dobin transset-df
	dodoc README
	dodoc ChangeLog
}
