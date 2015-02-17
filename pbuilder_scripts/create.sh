#!/bin/sh
mkdir -p pbuilder/build
sudo pbuilder create \
  --distribution wheezy \
  --mirror ftp://ftp.us.debian.org/debian/ \
  --othermirror "deb http://debrepo01.sf.viadeo.local/debian wheezy main contrib non-free|deb http://debrepo01.sf.viadeo.local/debian demo main contrib non-free|deb http://backports.debian.org/debian-backports wheezy-backports main contrib non-free" \
  --debootstrapopts "--keyring=/usr/share/keyrings/debian-archive-keyring.gpg" \
  --basetgz ./wheezy64-viadeo.tgz \
  --buildplace pbuilder/build \
  --aptcache "" \
  --architecture "amd64"
