# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

MY_PN="jquery.hotkeys"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Javascript jQuery plugin for hooking keyboard events"
HOMEPAGE="http://plugins.jquery.com/project/hotkeys"
SRC_URI="http://js-hotkeys.googlecode.com/files/${MY_P}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86-macos"
IUSE=""
S="${WORKDIR}/${MY_P}"

DEPEND=""
RDEPEND="${DEPEND}
	dev-javascript/jquery"

src_install() {
	insinto "/usr/share/${PN}"
	doins "${MY_PN}.js" "${MY_PN}.min.js"
}
