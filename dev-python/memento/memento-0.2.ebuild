# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/sqlobject/sqlobject-0.7.0.ebuild,v 1.5 2006/07/28 12:04:40 liquidx Exp $

inherit distutils

DESCRIPTION="WSGI middleware for per request code reloading"
HOMEPAGE="http://lukearno.com/projects/memento/"
SRC_URI="http://cheeseshop.python.org/packages/source/m/${PN}/${P}.tar.gz"
LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~ppc ~sparc ~x86"
IUSE=""
RDEPEND="dev-python/resolver"
