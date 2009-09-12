# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


inherit distutils subversion

DESCRIPTION="A Python framework for CAPTCHA tests"
HOMEPAGE="http://svn.navi.cx/misc/tags/pycaptcha-0.4/"
ESVN_REPO_URI="http://svn.navi.cx/misc/tags/pycaptcha-0.4/"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86-macos"

RDEPEND="dev-python/imaging"
DEPEND="${RDEPEND}"

