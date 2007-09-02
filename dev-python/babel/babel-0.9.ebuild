# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
#!/bin/bash

inherit distutils

MY_P=Babel-${PV}
S="${WORKDIR}/${MY_P}"

DESCRIPTION="Internationalization utilities"
HOMEPAGE="http://babel.edgewall.org/"
SRC_URI="http://ftp.edgewall.com/pub/${PN}/${MY_P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

DEPEND="doc? ( dev-python/epydoc )
	test? ( dev-python/nose )"
RDEPEND=""

src_install() {
	distutils_src_install
	use doc && dohtml -r doc/*.html
}
