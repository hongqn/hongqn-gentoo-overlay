# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eggs

DESCRIPTION="Tool for listing installed eggs, egg metadata, egg dependencies"
HOMEPAGE="http://eggs.gentooexperimental.org/"
SRC_URI="http://cheeseshop.python.org/packages/2.4/y/yolk/${P}-py2.4.egg"

LICENSE="PSF"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="=dev-lang/python-2.4*"
DEPEND="${RDEPEND}"

