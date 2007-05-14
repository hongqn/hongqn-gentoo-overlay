# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

MY_P=${P/flickruploadr/FlickrUploadr}
S=${WORKDIR}/${MY_P}

DESCRIPTION="Little drag and drop Flickr uploader"
HOMEPAGE="http://micampe.it/things/flickruploadr"
SRC_URI="http://micampe.it/files/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-python/pygtk"
