# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/buildutils/buildutils-0.1.2.ebuild,v 1.4 2007/07/31 09:10:13 dev-zero Exp $

inherit distutils subversion

KEYWORDS="~amd64 ~x86"

DESCRIPTION="Distutils extensions for developing Python libraries and applications."
HOMEPAGE="http://buildutils.lesscode.org/"
ESVN_REPO_URI="svn://lesscode.org/${PN}/trunk"
LICENSE="MIT"
SLOT="0"
IUSE="doc"

DEPEND="dev-python/setuptools
	doc? ( dev-python/pudge )"
RDEPEND=""

src_compile() {
	distutils_src_compile
	if use doc ; then
		einfo "Generating docs as requested..."
		"${python}" setup.py pudge || die "generating docs failed"
	fi
}

src_install() {
	distutils_src_install
	use doc && dohtml -r doc/html/*
}
