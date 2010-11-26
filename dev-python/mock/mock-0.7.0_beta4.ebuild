# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/mock/mock-0.6.0.ebuild,v 1.3 2010/04/24 21:17:20 arfrever Exp $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"

MY_PV="${PV/_beta/b}"
MY_P="${PN}-${MY_PV}"
S="${WORKDIR}/${MY_P}"

inherit distutils

DESCRIPTION="A Python Mocking and Patching Library for Testing"
HOMEPAGE="http://www.voidspace.org.uk/python/mock/ http://pypi.python.org/pypi/mock"
SRC_URI="http://pypi.python.org/packages/source/${PN:0:1}/${PN}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86-macos"
IUSE="doc"

DEPEND="app-arch/unzip"
RDEPEND=""
RESTRICT_PYTHON_ABIS="3.*"

DOCS="docs/*.txt"
PYTHON_MODNAME="mock.py"

src_install() {
	distutils_src_install

	if use doc; then
		dodoc mock.pdf
		dohtml -r html/*
	fi
}
