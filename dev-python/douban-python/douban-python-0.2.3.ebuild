inherit distutils

DESCRIPTION="Python client library for Douban APIs"
HOMEPAGE="http://code.google.com/p/douban-python/"
SRC_URI="http://douban-python.googlecode.com/files/${P}.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86-macos"
IUSE=""

DEPEND="dev-python/setuptools
	dev-python/gdata"
RDEPEND=""

S="${WORKDIR}/${PN}"
