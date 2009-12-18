# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit distutils

DESCRIPTION="SQLAlchemy Schema Migration Tools"
HOMEPAGE="http://code.google.com/p/sqlalchemy-migrate/"
SRC_URI="http://sqlalchemy-migrate.googlecode.com/files/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86-macos"
IUSE="test doc"

DEPEND=">=dev-python/sqlalchemy-0.5
	dev-python/decorator
	test? ( >=dev-python/nose-0.10 )
	doc? ( >=dev-python/sphinx-0.5 )"
RDEPEND="${DEPEND}"

