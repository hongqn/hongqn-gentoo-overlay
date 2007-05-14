# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/sqlobject/sqlobject-0.7.0.ebuild,v 1.5 2006/07/28 12:04:40 liquidx Exp $

inherit distutils

DESCRIPTION="WSGI delegation based on URL path and method"
HOMEPAGE="http://lukearno.com/projects/selector/"
SRC_URI="http://cheeseshop.python.org/packages/source/s/${PN}/${P}.tar.gz"
LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~ppc ~sparc ~x86"
IUSE=""
RDEPEND="dev-lang/python
	dev-python/wsgiref
	dev-python/resolver"
