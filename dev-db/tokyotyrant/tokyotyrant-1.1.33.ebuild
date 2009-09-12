DESCRIPTION="Network interface of Tokyo Cabinet"
HOMEPAGE="http://tokyocabinet.sourceforge.net/"
SRC_URI="http://tokyocabinet.sourceforge.net/tyrantpkg/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~x86-macos"
IUSE="-debug -devel -profile -static +shared -lua"

DEPEND="dev-db/tokyocabinet
	lua? ( dev-lang/lua )"
RDEPEND="${DEPEND}"

src_compile() {
   econf \
      $(use_enable debug) \
      $(use_enable devel) \
      $(use_enable profile) \
      $(use_enable static) \
      $(use_enable shared) \
      $(use_enable lua) \
      || die "econf failed!"

   emake || die "emake failed!"
}

src_install() {
   emake DESTDIR="${D}" install || die "emake install failed"
   dodoc ChangeLog THANKS README || die
   dohtml doc/* || die
}
