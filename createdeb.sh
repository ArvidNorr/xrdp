#!/bin/sh
# A simple script that collects the files needed to create a debian installer.
# The script then creates a simple deb file.
# 
echo "This script requires that make and make install is already performed."
echo "run this script as root."
echo "see file file-loc.txt on what files that are included"

rm -R build/debian
# the working folder
mkdir -p build/debian
# add some subfolders
mkdir -p build/debian/usr/local/sbin
mkdir -p build/debian/usr/local/bin
mkdir -p build/debian/etc/xrdp
mkdir -p build/debian/etc/pam.d/
mkdir -p build/debian/usr/local/lib/xrdp
mkdir -p build/debian/usr/local/share/xrdp
mkdir -p build/debian/DEBIAN
#
#
cp /usr/local/lib/xrdp/* build/debian/usr/local/lib/xrdp/
#
cp /usr/local/bin/xrdp-genkeymap build/debian/usr/local/bin/xrdp-genkeymap
cp /usr/local/bin/xrdp-keygen build/debian/usr/local/bin/xrdp-keygen
cp /usr/local/bin/xrdp-sesadmin build/debian/usr/local/bin/xrdp-sesadmin
cp /usr/local/bin/xrdp-sesrun build/debian/usr/local/bin/xrdp-sesrun
cp /usr/local/bin/xrdp-sestest build/debian/usr/local/bin/xrdp-sestest
# not included in file-loc.txt
cp /usr/local/bin/xrdp-dis build/debian/usr/local/bin/xrdp-dis

# /usr/local/sbin/
cp /usr/local/sbin/xrdp build/debian/usr/local/sbin/xrdp
cp /usr/local/sbin/xrdp-chansrv build/debian/usr/local/sbin/xrdp-chansrv
cp /usr/local/sbin/xrdp-sesman build/debian/usr/local/sbin/xrdp-sesman
cp /usr/local/sbin/xrdp-sessvc build/debian/usr/local/sbin/xrdp-sessvc
#
cp /etc/xrdp/* build/debian/etc/xrdp/
#
cp /etc/pam.d/xrdp-sesman build/debian/etc/pam.d/xrdp-sesman

echo "man pages excluded"
# TODO add
#/usr/local/share/man/man5
#  sesman.ini.5
#  xrdp.ini.5
#
#/usr/local/share/man/man8
#  xrdp.8
#  xrdp-sesman.8
#  xrdp-sesrun.8
#
cp /usr/local/share/xrdp/* build/debian/usr/local/share/xrdp/
#

cp DEBIAN/* build/debian/DEBIAN
chmod 0555 build/debian/DEBIAN/postinst
chmod 0555 build/debian/DEBIAN/prerm
cd build
dpkg-deb --build debian xrdp.deb
