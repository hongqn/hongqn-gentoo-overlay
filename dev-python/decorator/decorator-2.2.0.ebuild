# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

NEED_PYTHON="2.4"

inherit distutils

DESCRIPTION="Better living through Python with decorators"
HOMEPAGE="http://www.phyast.pitt.edu/~micheles/python/documentation.html"
SRC_URI="http://www.phyast.pitt.edu/~micheles/python/${P}.zip"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DOCS="CHANGES.txt README.txt documentation.txt documentation.pdf"

src_unpack() {
	mkdir ${P}; cd ${P}
	unpack ${A} || die "unpack failed"
}

src_install() {
	distutils_src_install
	use doc && dohtml documentation.html
}

src_test() {
	PYTHONPATH=. "${python}" doctester.py documentation.txt || die "tests failed"
}
