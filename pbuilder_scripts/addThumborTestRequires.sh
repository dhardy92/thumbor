#!/bin/sh
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
apt-get -y install devscripts libxslt-dev libxml2-dev python-pip python-pycurl python-dev libcurl4-openssl-dev rubygems ruby1.8-dev fakeroot build-essential python-six && \
pip install 'simplejson>=2.1.6,<2.2.0' 'pyvows' 'preggy' 'tornado-pyvows' 'coverage' 'nose' 'colorama' 'numpy' && \
apt-get source libwebp && \
( cd libwebp* && apt-get build-dep -y libwebp && debuild -i -us -uc -b ) && \
dpkg -i libwebp5*.deb libwebp-dev*.deb libwebpdemux1*.deb libwebpmux1*.deb && \
gem install fpm && \
for i in pillow statsd pexif derpconf thrift hbase-thrift thumbor_hbase; do
  fpm -s python -t deb $i && dpkg -i ./python-${i//_/-}_*.deb
done
