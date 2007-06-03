# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

NEED_PYTHON=2.4

inherit distutils

MY_PN="twForms"
MY_P=${MY_PN}-${PV/_pre/a2dev-r}

DESCRIPTION="Web widget creation toolkit based on TurboGears widgets"
HOMEPAGE="http://toscawidgets.org"
SRC_URI="http://toscawidgets.org/download/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND=">=dev-python/toscawidgets-0.1_pre1
	>=dev-python/formencode-0.6
	>=dev-python/genshi-0.3.6"

S=${WORKDIR}/${MY_P}
PYTHON_MODNAME="toscawidgets.widgets"
DOCS="CHANGELOG.txt CONTRIBUTORS.txt README.txt"

src_test() {
	"${python}" ./setup.py test | die "Tests failed"
}
