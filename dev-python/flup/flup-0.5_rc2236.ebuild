# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
#!/bin/bash

inherit distutils versionator

REV=$(expr $PV : '.*rc\([0-9]\+\)')

DESCRIPTION="Python implementation of the WSGI and FastCGI interfaces"
HOMEPAGE="http://www.saddi.com/software/flup/"
SRC_URI="http://www.saddi.com/software/flup/dist/$PN-r$REV.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-lang/python-2.4"
S=${WORKDIR}/${PN}-r${REV}
