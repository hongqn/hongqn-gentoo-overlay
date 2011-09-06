# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
MY_P=${PN}_${PV}

DESCRIPTION="A command line tool (daemon) that monitors sleep, wakeup and idleness of a Mac"
HOMEPAGE="http://www.bernhard-baehr.de/"
SRC_URI="http://www.bernhard-baehr.de/${MY_P}.tgz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x64-macos"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}/sources"

src_prepare() {
	sed -i -e '/PPC/d' -e 's/-mtune.*//' -e 's/sleepwatcher.ppc//' Makefile || die
}

src_install() {
	dobin sleepwatcher || die
	doman ../sleepwatcher.8 || die
	dodoc ../ReadMe.rtf ../config/*
}
