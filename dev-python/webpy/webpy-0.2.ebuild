# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

MY_PN="web.py"
MY_P=${MY_PN}-${PV}
S=${WORKDIR}/${MY_P}

DESCRIPTION="web.py: makes web apps"
HOMEPAGE="http://webpy.org/"
SRC_URI="http://webpy.org/${MY_P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cheetah flup"

RDEPEND="cheetah? dev-python/cheetah
	flup? dev-python/flup"

