# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion xfce44

XFCE_BETA_VERSION="4.3.99.1"
THUNAR_BETA_VERSION="0.4.0_rc1"
xfce44_beta

DESCRIPTION="Xfce4 panel RSS aggregator"
KEYWORDS="~amd64"
HOMEPAGE="http://goodies.xfce.org/"
ESVN_REPO_URI="http://svn.xfce.org/svn/goodies/xfce4-rss-plugin/trunk"
ESVN_BOOTSTRAP="autogen.sh"

DEPEND="xfce-extra/xfce4-dev-tools"
RDEPEND=""

