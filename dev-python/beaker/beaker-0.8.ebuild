# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/beaker/beaker-0.7.3.ebuild,v 1.2 2007/06/30 21:42:38 hawking Exp $

inherit distutils

MY_PN=Beaker
MY_P=${MY_PN}-${PV}

DESCRIPTION="A Session and Caching library with WSGI Middleware"
HOMEPAGE="http://beaker.groovie.org/"
SRC_URI="http://cheeseshop.python.org/packages/source/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
DEPEND="dev-python/setuptools"
RDEPEND=""
S=${WORKDIR}/${MY_P}

src_install() {
	distutils_src_install
	dodoc CHANGELOG
}

src_test() {
	PYTHONPATH=. "${python}" setup.py nosetests || die "tests failed"
}
