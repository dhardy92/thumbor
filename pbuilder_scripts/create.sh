#!/bin/sh
mkdir -p pbuilder/build
sudo pbuilder create \
  --distribution squeeze \
  --mirror ftp://ftp.fr.debian.org/debian/ \
  --othermirror "deb http://debrepo01.sf.viadeo.local/debian squeeze main contrib non-free|deb http://debrepo01.sf.viadeo.local/debian demo main contrib non-free|deb http://backports.debian.org/debian-backports squeeze-backports main contrib non-free" \
  --debootstrapopts "--keyring=/usr/share/keyrings/debian-archive-keyring.gpg" \
  --basetgz ./squeeze64-viadeo.tgz \
  --buildplace pbuilder/build \
  --aptcache "" \
  --architecture "amd64"
