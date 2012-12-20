# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit git-2

DESCRIPTION="Git extensions for Vincent Driessen branching."
HOMEPAGE="http://github.com/nvie/gitflow"
EGIT_REPO_URI="git://github.com/nvie/gitflow.git"
EGIT_COMMIT="1ffb6b1091f05466d3cd"
EGIT_HAS_SUBMODULES="1"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x64-macos"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	return
}

src_install() {
	einstall || die "emake install"
}
