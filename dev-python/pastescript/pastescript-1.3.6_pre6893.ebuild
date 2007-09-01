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
SRC_URI="http://pylonshq.com/download/0.9.6rc2/${MY_P}.tar.gz"
LICENSE="MIT"
SLOT="0"
IUSE=""
S="${WORKDIR}/${MY_P}"

DEPEND="dev-python/setuptools
	>=dev-python/paste-1.3
	dev-python/pastedeploy"

src_test() {
	PYTHONPATH=. "${python}" setup.py test || die "tests failed"
}
