# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A high performance library similar to the DBM family"
HOMEPAGE="http://sourceforge.net/projects/tokyocabinet/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86-macos"
IUSE="+bzip2 +zlib +threads fastest -debug -devel -profile -static -off64 -swab
-uyield +shared"

DEPEND="bzip2? ( >=app-arch/bzip2-1.0.5 )
      zlib? ( >=sys-libs/zlib-1.2.3 )"

RDEPEND="${DEPEND}"

src_compile() {
   econf \
   	$(use_enable bzip2) \
	$(use_enable zlib) \
	$(use_enable threads pthread) \
	$(use_enable shared) \
	$(use_enable fastest) \
	$(use_enable debug) \
	$(use_enable devel) \
	$(use_enable profile) \
	$(use_enable static) \
	$(use_enable off64) \
	$(use_enable swab) \
	$(use_enable uyield) \
	|| die "econf failed!"
   emake || die "emake failed"
}

src_install() {
   emake DESTDIR="${D}" install || die "emake install failed"
   dodoc ChangeLog THANKS README || die
   dohtml doc/* || die
}
