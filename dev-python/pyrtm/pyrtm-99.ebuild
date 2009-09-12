inherit distutils mercurial

DESCRIPTION="Remember The Milk API"
EHG_REPO_URI="http://bitbucket.org/srid/pyrtm/"
SLOT="0"
S="${WORKDIR}/${PN}"
LICENSE="MIT"
KEYWORDS="~x86-macos"

RDEPEND="dev-python/simplejson"

src_install() {
	distutils_src_install
	insinto "/usr/share/doc/${PF}"
	doins app.py
}
