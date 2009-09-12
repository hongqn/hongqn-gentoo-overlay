# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/libmatroska/libmatroska-0.8.1.ebuild,v 1.9 2007/12/29 11:30:49 vapier Exp $

inherit flag-o-matic eutils toolchain-funcs

DESCRIPTION="Extensible multimedia container format based on EBML"
HOMEPAGE="http://www.matroska.org/"
SRC_URI="http://www.bunkus.org/videotools/mkvtoolnix/sources/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86-freebsd ~amd64-linux ~ia64-linux ~x86-linux ~x86-macos"
IUSE=""

DEPEND=">=dev-libs/libebml-0.7.6"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/${P}-respectflags.patch"
}

src_compile() {
	cd "${S}/make/linux"

	#fixes locale for gcc3.4.0 to close bug 52385
	append-flags $(test-flags -finput-charset=ISO8859-15)

	emake PREFIX="${EPREFIX}/usr" \
		LIBEBML_INCLUDE_DIR="${EPREFIX}/usr/include/ebml" \
		LIBEBML_LIB_DIR="${EPREFIX}/usr/$(get_libdir)" \
		CXX="$(tc-getCXX)" || die "make failed"
}

src_install() {
	cd "${S}/make/linux"

	emake prefix="${ED}/usr" libdir="${ED}/usr/$(get_libdir)" install || die "make install failed"
	dodoc "${S}/ChangeLog"
}
