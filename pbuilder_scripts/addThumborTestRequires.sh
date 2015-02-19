#!/bin/sh
apt-get -y install devscripts libxslt-dev libxml2-dev python-pip python-pycurl python-dev libcurl4-openssl-dev rubygems ruby1.8-dev fakeroot build-essential && \
pip install 'simplejson>=2.1.6,<2.2.0' 'pyvows' 'preggy' 'tornado-pyvows' 'coverage' 'nose' 'colorama' 'numpy' && \
apt-get source libwebp && \
( cd libwebp* && apt-get build-dep -y libwebp && debuild -i -us -uc -b ) && \
dpkg -i libwebp5*.deb libwebp-dev*.deb libwebpdemux1*.deb libwebpmux1*.deb && \
gem install fpm && \
for i in pillow statsd pexif; do
  fpm -s python -t deb $i && dpkg -i ./python-${i}_*.deb
done
