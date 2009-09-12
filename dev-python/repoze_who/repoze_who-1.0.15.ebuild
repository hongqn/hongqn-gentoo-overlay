inherit distutils

MY_PN="repoze.who"
MY_P="${MY_PN}"-${PV}
S="${WORKDIR}/${MY_P}"

DESCRIPTION="repoze.who is an identification and authentication framework for WSGI"
HOMEPAGE="http://www.repoze.org"
SRC_URI="http://pypi.python.org/packages/source/r/${MY_PN}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86-macos"
IUSE=""

DEPEND="dev-python/paste
	net-zope/zopeinterface
	dev-python/setuptools"
