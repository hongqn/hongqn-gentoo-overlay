# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/demjson/demjson-1.4.ebuild,v 1.4 2010/06/29 23:55:46 arfrever Exp $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Read and write JSON-encoded data, compliant with RFC 4627"
HOMEPAGE="http://deron.meranda.us/python/demjson/ http://pypi.python.org/pypi/demjson"
SRC_URI="http://deron.meranda.us/python/${PN}/dist/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 x86 ~x86-macosx"
IUSE="doc test"

DEPEND="dev-python/setuptools"
RDEPEND=""

DOCS="AUTHORS.txt CHANGES.txt NEWS.txt THANKS.txt"
PYTHON_MODNAME="demjson.py"

src_test() {
	cd test

	testing() {
		PYTHONPATH="../build-${PYTHON_ABI}/lib" "$(PYTHON)" test_demjson.py
	}
	python_execute_function testing
}

src_install() {
	distutils_src_install

	if use doc; then
		dohtml -r docs/* || die "Installation of documentation failed"
	fi
}
