# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit distutils

DESCRIPTION="Enhancements to virtualenv"
HOMEPAGE="http://www.doughellmann.com/projects/virtualenvwrapper/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x64-macos"
IUSE=""

DEPEND="dev-python/setuptools
	dev-python/virtualenv"
RDEPEND="${DEPEND}"

