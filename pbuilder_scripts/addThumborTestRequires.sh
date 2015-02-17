#!/bin/sh
su - -c "apt-get -y install libxslt-dev libxml2-dev python-pip python-pycurl python-dev libcurl4-openssl-dev & pip install 'simplejson>=2.1.6,<2.2.0' 'pyvows' 'preggy' 'tornado-pyvows' 'coverage' 'nose' 'colorama' 'numpy'"
