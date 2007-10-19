# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pylons/pylons-0.9.4.1.ebuild,v 1.1 2007/02/28 00:08:39 dev-zero Exp $

NEED_PYTHON=2.3

inherit distutils

KEYWORDS="~amd64 ~x86"

MY_PN=Pylons
MY_P=${MY_PN}-${PV}

DESCRIPTION="Pylons Web Framework"
HOMEPAGE="http://pylonshq.com"
SRC_URI="http://pypi.python.org/packages/source/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"
LICENSE="BSD"
SLOT="0"
IUSE="doc cheetah myghty kid genshi"

RDEPEND=">=dev-python/routes-1.7
	>=dev-python/webhelpers-0.3.2
	>=dev-python/beaker-0.7.5
	>=dev-python/paste-1.4
	>=dev-python/pastedeploy-1.3.1
	>=dev-python/pastescript-1.3.6
	>=dev-python/formencode-0.7
	>=dev-python/simplejson-1.7.1
	>=dev-python/decorator-2.1.0
	>=dev-python/nose-0.9.3
	>=dev-python/mako-0.1.8
	cheetah? ( >=dev-python/cheetah-1.0
		>=dev-python/turbocheetah-0.9.5 )
	myghty? ( >=dev-python/myghty-1.1 )
	kid? ( >=dev-python/kid-0.9
		>=dev-python/turbokid-0.9.1 )
	genshi? ( >=dev-python/genshi-0.3.6 )"
DEPEND="${RDEPEND}
	>=dev-python/setuptools-0.6_rc5
	doc? ( >=dev-python/docutils-0.4
		>=dev-python/elementtree-1.2.6
		>=dev-python/kid-0.9
		>=dev-python/pygments-0.7
		>=dev-python/pudge-0.1.3
		>dev-python/buildutils-0.1.2 )"

# The tests fail, needs further investigation
RESTRICT="test"

S="${WORKDIR}/${MY_P}"

src_compile() {
	distutils_src_compile
	if use doc; then
		einfo "Generating docs as requested..."
		"${python}" setup.py pudge -m ${PN} || die "generating docs failed"
	fi
}

src_install() {
	distutils_src_install
	use doc && dohtml -r docs/html/*
}

src_test() {
	PYTHONPATH=. "${python}" setup.py nosetests || die "tests failed"
}