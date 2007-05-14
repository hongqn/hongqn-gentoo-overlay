# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

NEED_PYTHON=2.4

inherit distutils

MY_PN="ToscaWidgets"
MY_P=${MY_PN}-${PV/_pre/a2dev-r}

DESCRIPTION="Web widget creation toolkit based on TurboGears widgets"
HOMEPAGE="http://toscawidgets.org/"
SRC_URI="http://toscawidgets.org/download/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cheetah kid genshi mako test doc cjson examples"

__cheetah_depend=">=dev-python/cheetah-1.0
				  >=dev-python/turbocheetah-0.9.5"
__genshi_depend=">=dev-python/genshi"
__kid_depend=">=dev-python/kid-0.9.5
			  >=dev-python/turbokid-0.9.9"
__mako_depend=">=dev-python/mako-0.1.1"
DEPEND="dev-python/setuptools"
RDEPEND=">=dev-python/ruledispatch-0.5_pre2247
		>=dev-python/paste-1.1
		dev-python/pastescript
		dev-python/simplejson
		dev-python/decoratortools
		cheetah? ( $__cheetah_depend )
		genshi? ( $__genshi_depend )
		kid? ( $__kid_depend )
		mako? ( $__mako_depend )
		test? ( $__cheetah_depend
				$__genshi_depend
				$__kid_depend
				$__mako_depend )
		doc? ( >=dev-python/pudge-0.1.1_pre130
			   >=dev-python/buildutils-0.1.2_pre107
			   >=dev-python/kid-0.9.4
			   dev-python/docutils )
		cjson? ( dev-python/python-cjson )"

S=${WORKDIR}/${MY_P}
PYTHON_MODNAME="ToscaWidgets"
DOCS="CHANGELOG.txt CONTRIBUTORS.txt README.txt"

src_compile() {
	distutils_src_compile
	use doc && ( rst2html.py docs/*.txt || die "compile docs" )
}

src_install() {
	distutils_src_install
	cd ${S}
	if use doc; then
		dodoc docs/*.txt
		dohtml docs/*.htm
	fi
	if use examples; then
		insinto /usr/share/doc/${PF}
		doins -r examples
	fi
}

src_test() {
	"${python}" ./setup.py test | die "Tests failed"
}
