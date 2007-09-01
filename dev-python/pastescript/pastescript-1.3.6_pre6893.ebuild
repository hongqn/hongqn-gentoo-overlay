# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pastescript/pastescript-1.1.ebuild,v 1.3 2007/07/04 20:55:13 lucass Exp $

NEED_PYTHON=2.4

inherit distutils

KEYWORDS="~amd64 ~x86"

MY_PN=PasteScript
MY_PV=${PV/_pre/dev-r}
MY_P=${MY_PN}-${MY_PV}

DESCRIPTION="A pluggable command-line frontend, including commands to setup package file layouts"
HOMEPAGE="http://pythonpaste.org/script/"
SRC_URI="http://pylonshq.com/download/0.9.6rc2/${MY_P}.tar.gz"
LICENSE="MIT"
SLOT="0"
IUSE="doc test"

RDEPEND="dev-python/paste
	dev-python/pastedeploy
	dev-python/cheetah"
DEPEND="${RDEPEND}
	dev-python/setuptools
	doc? ( dev-python/pudge dev-python/buildutils )
	test? ( dev-python/nose )"

S="${WORKDIR}/${MY_P}"
PYTHON_MODNAME="paste/script"

src_test() {
	PYTHONPATH=build/lib "${python}" setup.py test || die "tests failed"
}
