# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

MY_PV=${PV}jo
MY_PR=${PR/r3/III}
MY_P=${PN}-${MY_PV}-${MY_PR}
DESCRIPTION="menu-driven tool for installing Windows programs under wine"
HOMEPAGE="http://www.von-thadden.de/Joachim/WineTools/"
SRC_URI="http://ds80-237-203-29.dedicated.hosteurope.de/wt/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE=""

RDEPEND=">app-emulation/wine-0.9
	x11-misc/xdialog
	dev-lang/perl
	virtual/x11"
DEPEND="${RDEPEND}
	sys-devel/gettext"

S=${WORKDIR}/${MY_P}

WT=wt${MY_PV}

src_unpack() {
	unpack ${A}
	cd "${S}"
	sed -i \
		-e "s:/usr/local/winetools:/usr/share/winetools:g" \
		-e 's:^DIALOG=.*:DIALOG=$(which Xdialog):' \
		-e "s:\${BASEDIR}/doc/README\.\(\$\?[a-zA-Z0-9{}]*\)\([ \"]\):"\
"/usr/share/doc/${P}-${PR}/README\.\1.gz\2:g" \
		-e "s:cat\( .*README\):zcat\1:g" \
		${WT} findwine || die "sed failed"
	
	# disable versio check and don't "clear" screen when finished
	epatch "${FILESDIR}/${P}-clear_and_version-check.patch"

}

src_install() {
	dodoc doc/README.* doc/*.txt
	dohtml doc/*.html doc/*.gif

	local i
	for i in $(find po -name '*.po' -printf '%P ') ; do
		i=${i%.*}
		dodir /usr/share/locale/${i}
		msgfmt po/${i}.po -o "${D}"/usr/share/locale/${i}/wt2.mo || die "msgfmt ${i} failed"
	done

	exeinto /usr/share/winetools
	doexe chopctrl.pl findwine listit ${WT} || die "doexe"
	rm -f INSTALL.txt LICENSE.txt
	insinto /usr/share/winetools
	doins -r *.reg || die "doins"

	cp -RP scripts 3rdParty "${D}"/usr/share/winetools/

	dodir /usr/bin
	dosym /usr/share/winetools/findwine /usr/bin/findwine
	dosym /usr/share/winetools/${WT} /usr/bin/wt2
	dosym /usr/share/winetools/${WT} /usr/bin/winetools
	
	make_desktop_entry winetools Winetools wine Emulation
}

pkg_postinst(){
	einfo
	einfo "You can adjust some base path definitions in the"
	einfo "script itself (e.g. define dir for wine application start scripts)"
	einfo " -> vim /usr/bin/winetools"
	einfo
	einfo "If you don't want the intro and readme to show up"
	einfo "on every start of winetools you can comment out"
	einfo "the readme and howto command at the bottom of "
	einfo "/usr/bin/winetools."
	einfo 
}
