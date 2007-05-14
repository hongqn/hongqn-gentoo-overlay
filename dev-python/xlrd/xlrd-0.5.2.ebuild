# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Library for developers to extract data from Microsoft Excel (tm) spreadsheet files"
HOMEPAGE="http://www.lexicon.net/sjmachin/xlrd.htm"
SRC_URI="http://www.lexicon.net/sjmachin/${P}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-text/dos2unix"
RDEPEND=""

src_unpack() {
	unpack ${A} || die "unpack"
	epatch ${FILESDIR}/${P}-script.patch || die "patch"
	dos2unix ${S}/scripts/runxlrd.py
}
