# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pylons/pylons-0.9.4.1.ebuild,v 1.1 2007/02/28 00:08:39 dev-zero Exp $

NEED_PYTHON=2.3

inherit distutils

KEYWORDS="~amd64 ~x86"

MY_PN=Pylons
MY_P=${MY_PN}-${PV}

DESCRIPTION="A lightweight web framework emphasizing flexibility and rapid development."
HOMEPAGE="http://pylonshq.com"
SRC_URI="http://cheeseshop.python.org/packages/source/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"
LICENSE="BSD"
SLOT="0"
IUSE="doc"

RDEPEND=">=dev-python/routes-1.6.3
	>=dev-python/webhelpers-0.3
	>=dev-python/beaker-0.6.3
	>=dev-python/paste-1.3
	>=dev-python/pastedeploy-1.3
	>=dev-python/pastescript-1.3.2
	>=dev-python/myghty-1.1
	>=dev-python/formencode-0.7
	>=dev-python/simplejson-1.7.1
	>=dev-python/decorator-2.0.1
	>=dev-python/nose-0.9.2
	>=dev-python/mako-0.1.5"
DEPEND="${RDEPEND}
	dev-python/setuptools
	doc? ( dev-python/pudge dev-python/buildutils )"

# The tests fail, needs further investigation
RESTRICT="test"

S=${WORKDIR}/${MY_P}

src_unpack() {
	unpack ${A}
	cd "${S}"

	sed -i \
		-e 's|dest =.*|dest = docs/html|' \
		setup.cfg || die "sed failed"
	sed -i \
		-e '/use_setuptools/d' \
		-e '/install_requires=\[.*\],/d' \
		-e '/install_requires/, /],/d' \
		-e '/extras_require/, /},/d' \
		setup.py || die "sed failed"
}

src_compile() {
	distutils_src_compile
	if use doc ; then
		einfo "Generating docs as requested..."
		"${python}" setup.py pudge || die "generating docs failed"
	fi
}

src_install() {
	distutils_src_install
	use doc && dohtml -r docs/html/*
}

pkg_postinst() {
	elog "pylons can make use of many other packages like:"
	elog " cheetah, genshi, kid or pudge"
}

src_test() {
	PYTHONPATH=. "${python}" setup.py nosetests || die "tests failed"
}
