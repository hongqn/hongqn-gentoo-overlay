# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

MY_PN="Elixir"
MY_P=${MY_PN}-${PV}
S=${WORKDIR}/${MY_P}

DESCRIPTION="Declarative Mapper for SQLAlchemy"
HOMEPAGE="http://elixir.ematia.de/"
SRC_URI="http://cheeseshop.python.org/packages/source/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="doc? ( >=dev-python/docutils-0.4
				>=dev-python/elementtree-1.2.6
				>=dev-python/kid-0.9
				>=dev-python/pygments-0.7
				>=dev-python/pudge-0.1.3
				>=dev-python/buildutils-0.1.2 )"
RDEPEND=">=dev-python/sqlalchemy-0.3.0"

src_test() {
	"${python}" ./setup.py test | die "Tests failed"
}
