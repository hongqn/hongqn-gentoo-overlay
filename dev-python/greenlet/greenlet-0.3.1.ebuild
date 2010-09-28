# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
PYTHON_DEPEND="*"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="Lightweight in-process concurrent programming"
HOMEPAGE="http://bitbucket.org/ambroff/greenlet"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86-macos"
IUSE=""

DEPEND="dev-python/setuptools
	test? ( dev-python/nose )"
RDEPEND="${DEPEND}"

src_test() {
	testing() {
		PYTHONPATH=".:$(dir -d build-${PYTHON_ABI}/lib*)" "$(PYTHON)" setup.py test || dir "Tests failed"
	}
	python_execute_function testing
}

src_install() {
	distutils_src_install

	dodoc doc/greenlet.txt || die
}
