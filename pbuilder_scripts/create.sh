#!/bin/sh
mkdir -p pbuilder/build
sudo pbuilder create \
  --distribution wheezy \
  --mirror ftp://ftp.us.debian.org/debian/ \
  --othermirror "deb http://debrepo01.sf.viadeo.local/debian wheezy main contrib non-free|deb http://debrepo01.sf.viadeo.local/debian demo main contrib non-free|deb-src http://ftp.debian.org/debian/ jessie main contrib non-free" \
  --debootstrapopts "--keyring=/etc/apt/trusted.gpg" \
  --extrapackages "devscripts libxslt-dev libxml2-dev python-pip python-pycurl python-dev libcurl4-openssl-dev rubygems ruby1.8-dev fakeroot build-essential python-six" \
  --basetgz ./wheezy64-viadeo.tgz \
  --buildplace pbuilder/build \
  --aptcache "" \
  --architecture "amd64"
