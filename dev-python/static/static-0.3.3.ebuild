# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="A stupidly simple WSGI way to serve static (or mixed) content"
HOMEPAGE="http://lukearno.com/projects/static/"
SRC_URI="http://cheeseshop.python.org/packages/source/s/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="kidmagic"

RDEPEND="kidmagic? (>=dev-lang/python-2.4 dev-python/kid)"

