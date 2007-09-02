# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pastedeploy/pastedeploy-1.1.ebuild,v 1.1 2007/02/27 23:43:38 dev-zero Exp $

inherit distutils

KEYWORDS="~amd64 ~x86"

MY_PN=PasteDeploy
MY_P=${MY_PN}-${PV}

DESCRIPTION="Load, configure, and compose WSGI applications and servers"
HOMEPAGE="http://pythonpaste.org/deploy/"
SRC_URI="http://pypi.python.org/packages/source/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"
LICENSE="MIT"
SLOT="0"
IUSE="doc"
S=${WORKDIR}/${MY_P}

DEPEND="dev-python/setuptools
	doc? ( dev-python/pudge
		>dev-python/buildutils-0.1.2 )"

src_unpack() {
	unpack "${A}"
}

src_compile() {
	distutils_src_compile
	if use doc ; then
		einfo "Generating docs as requested..."
		PYTHONPATH=. "${python}" setup.py pudge || die "generating docs failed"
	fi
}

src_install() {
	distutils_src_install
	use doc && dohtml -r docs/html/*
}
