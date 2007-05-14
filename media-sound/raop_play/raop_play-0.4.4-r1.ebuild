DESCRIPTION="Apple Airport Express Client Player"
HOMEPAGE="http://raop-play.sourceforge.net"
SRC_URI="mirror://sourceforge/raop-play/${P}.tar.gz"

SLOT="0"
KEYWORDS="x86 ~amd64 ~sparc64 ~ppc"
IUSE="ssl X mp3 ogg"

LICENSE="GPL-2"

RDEPEND="dev-libs/openssl \
         media-libs/libsamplerate \
         media-libs/libid3tag \
         x11-libs/fltk \
		 dev-lang/perl"

DEPEND="$RDEPEND \
		mp3? ( media-sound/mpg321 ) \
		aac? ( media-libs/faad2 ) \
		ogg? ( media-sound/vorbis-tools ) \
        >=dev-libs/glib-2.0"

src_compile() {
	CFLAGS="${CFLAGS} `fltk-config --cflags`" \
	CXXFLAGS="${CXXFLAGS} `fltk-config --cxxflags`" \
	LDFLAGS="${LDFLAGS} `fltk-config --ldflags`" \
	./configure --prefix=/usr || die

	# hack for linking problem with fltk libraries
	perl -i -pe "s|\(GLIB_LINK\)|(GLIB_LINK) -L `dirname \`fltk-config --libs\``|" aexcl/Makefile

	CXXFLAGS="${CXXFLAGS} `fltk-config --cxxflags`" \
	emake || die
}

src_install() {
    make install DESTDIR=${D}
	cp raop_play/README README.raop_play
	dodoc README README.raop_play
}
