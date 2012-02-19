# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
#!/bin/bash

EAPI=3

inherit git-2 bash-completion-r1

DESCRIPTION="Bash and Zsh completion support for git-flow."
HOMEPAGE="https:/github.com/bobthecow/git-flow-completion"
EGIT_REPO_URI="git://github.com/bobthecow/git-flow-completion.git"
EGIT_COMMIT="429930f41c"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x64-macos"
IUSE=""

DEPEND=">=dev-vcs/git-1.7.1
	dev-vcs/git-flow"
RDEPEND="${DEPEND}"

src_install() {
	newbashcomp "${PN}.bash" git-flow
}

pkg_postinst() {
	elog "Run following to enable bash completion for git-flow:"
	elog "  eselect bashcomp enable git && eselect bashcomp enable git-flow"
}
