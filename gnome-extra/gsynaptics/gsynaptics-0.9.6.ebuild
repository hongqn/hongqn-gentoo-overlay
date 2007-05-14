# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2 eutils

DESCRIPTION="GSynaptics is a configuration tool for x11-drivers/synaptics."
HOMEPAGE="http://gsynaptics.sourceforge.jp/"
SRC_URI="mirror://sourceforge.jp/${PN}/19524/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~x86 ~ppc"

DEPEND=">=x11-libs/gtk+-2.6.0
	>=gnome-base/libgnomeui-2.0
	>=gnome-base/libglade-2.0"

DOCS="AUTHORS ChangeLog NEWS README TODO"

pkg_postinst()
{
	echo
	einfo "The following line needs to be added to the synaptics InputDevice"
	einfo "section of your xorg.conf file:"
	einfo "   Option \"SHMConfig\" \"on\""
	echo
}
