# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

MY_PN="Mako"
MY_P=${MY_PN}-${PV}

DESCRIPTION="A super-fast templating language that borrows the best ideas from the existing templating languages."
HOMEPAGE="http://www.makotemplates.org/"
SRC_URI="http://www.makotemplates.org/downloads/${MY_P}.tar.gz"
LICENSE="MIT"
IUSE="doc examples"
KEYWORDS="~x86 ~amd64"
SLOT="0"
S=${WORKDIR}/${MY_P}

DEPEND="dev-python/setuptools
	dev-python/beaker"

src_install() {
	distutils_src_install

	cd ${S}
	dodoc README CHANGES
	use doc && dohtml doc/*
	if use examples; then
		insinto /usr/share/doc/${PF}
		doins -r examples
	fi
}

src_test() {
	PYTHONPATH=lib "${python}" test/alltests.py || die "Tests failed"
}
