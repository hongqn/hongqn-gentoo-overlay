# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/libmemcache/libmemcache-1.2.4.ebuild,v 1.10 2006/06/23 21:40:23 gustavoz Exp $

inherit eutils

DESCRIPTION="C API for memcached"
HOMEPAGE="http://people.freebsd.org/~seanc/libmemcache/"
MY_P=${P/_/.}
SRC_URI="http://people.freebsd.org/~seanc/libmemcache/${MY_P}.tar.bz2"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
RDEPEND="net-misc/memcached"
S="${WORKDIR}/${MY_P}"

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	einstall || die "einstall failed"
}
