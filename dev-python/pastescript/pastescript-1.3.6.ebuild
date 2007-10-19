# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

KEYWORDS="~amd64 ~x86"

MY_PN=PasteScript
MY_PV=${PV/_pre/dev-r}
MY_P=${MY_PN}-${MY_PV}

DESCRIPTION="A pluggable command-line frontend, including commands to setup package file layouts"
HOMEPAGE="http://pythonpaste.org/script/"
SRC_URI="http://pypi.python.org/packages/source/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"
LICENSE="MIT"
SLOT="0"
IUSE="doc"
S="${WORKDIR}/${MY_P}"

DEPEND="dev-python/setuptools
	>=dev-python/paste-1.3
	dev-python/pastedeploy
	doc? ( dev-python/pudge )"

src_compile() {
	distutils_src_compile
	if use doc; then
		einfo "Generating docs as requested..."
		"${python}" setup.py pudge || die "generating docs failed"
	fi
}

src_install() {
	distutils_src_install
	use doc && dohtml -r docs/html/*
}

src_test() {
	PYTHONPATH=. "${python}" setup.py nosetests || die "tests failed"
}
