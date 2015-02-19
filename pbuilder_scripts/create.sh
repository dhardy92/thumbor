#!/bin/sh
mkdir -p pbuilder/build
sudo pbuilder create \
  --distribution wheezy \
  --mirror ftp://ftp.us.debian.org/debian/ \
  --othermirror "deb http://debrepo01.sf.viadeo.local/debian wheezy main contrib non-free|deb http://debrepo01.sf.viadeo.local/debian demo main contrib non-free|deb-src http://ftp.debian.org/debian/ jessie main contrib non-free" \
  --debootstrapopts "--keyring=$PWD/pbuilder_scripts/keyring.gpg" \
  --basetgz ./wheezy64-viadeo.tgz \
  --extrapackages devscripts libxslt-dev libxml2-dev python-pip python-pycurl python-dev libcurl4-openssl-dev rubygems ruby1.8-dev fakeroot build-essential \
  --buildplace pbuilder/build \
  --aptcache "" \
  --architecture "amd64"
