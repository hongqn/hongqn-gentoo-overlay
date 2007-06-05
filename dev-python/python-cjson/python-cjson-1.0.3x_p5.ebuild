# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

MY_P=${P/_p/}
S=${WORKDIR}/${MY_P}

DESCRIPTION="Fast JSON encoder/decoder for Python"
HOMEPAGE="http://python.cx.hu/python-cjson/"
SRC_URI="http://python.cx.hu/${PN}/${MY_P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

