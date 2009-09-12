# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-video/mkvtoolnix/mkvtoolnix-2.8.0.ebuild,v 1.1 2009/05/15 07:32:34 aballier Exp $

EAPI="1"
inherit eutils wxwidgets flag-o-matic qt4 autotools

DESCRIPTION="Tools to create, alter, and inspect Matroska files"
HOMEPAGE="http://www.bunkus.org/videotools/mkvtoolnix"
SRC_URI="http://www.bunkus.org/videotools/mkvtoolnix/sources/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86-freebsd ~amd64-linux ~x86-linux ~x86-macos"
IUSE="wxwindows flac bzip2 lzo qt4 debug"

DEPEND=">=dev-libs/libebml-0.7.7
	>=media-libs/libmatroska-0.8.1
	media-libs/libogg
	media-libs/libvorbis
	dev-libs/expat
	sys-libs/zlib
	dev-libs/boost
	wxwindows? ( x11-libs/wxGTK:2.8 )
	flac? ( media-libs/flac )
	bzip2? ( app-arch/bzip2 )
	lzo? ( dev-libs/lzo )
	qt4? ( x11-libs/qt-gui:4 )"
RDEPEND="${DEPEND}"

pkg_setup() {
	WX_GTK_VER="2.8"
	if use wxwindows; then
		need-wxwidgets unicode
	fi
}

src_unpack() {
	unpack ${A}
	cd "${S}"
	eautoreconf
}

src_compile() {
	use wxwindows && myconf="--with-wx-config=${WX_CONFIG}"
	econf \
		$(use_enable lzo) \
		$(use_enable bzip2 bz2) \
		$(use_enable wxwindows wxwidgets) \
		$(use_enable debug) \
		$(use_with flac) \
		$(use_enable qt4 qt) \
		${myconf} \
		|| die "./configure died"

	# Don't run strip while installing stuff, leave to portage the job.
	emake STRIP="true" || die "make failed"
}

src_install() {
	emake DESTDIR="${D}" STRIP="true" install || die "make install failed"
	dodoc AUTHORS ChangeLog README TODO
	doman doc/mkv{merge,extract,info}.1 || die "doman failed"
	dohtml doc/mkvmerge-gui.html doc/images/*
	docinto examples
	dodoc examples/*
}
