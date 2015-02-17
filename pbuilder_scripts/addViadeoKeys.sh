#!/bin/sh
su - -c 'apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 2B49177F 99104135 && apt-get update'
su - -c 'cat > /etc/apt/preferences.d/thumbor.pref' << EOF
Package: python-tornado
Pin: release a=squeeze-backports
Pin-Priority: 999
EOF

su - -c 'cat > /etc/apt/preferences.d/viadeo.pref' << EOF
Package: *
Pin: origin "debrepo01.sf.viadeo.local"
Pin-Priority: 999
EOF
