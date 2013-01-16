#!/bin/sh
# A simple script that collects the files needed to create a RPM installer.
# The script then creates a simple rpm file.
# 
echo "This script requires that make and make install is already performed."
echo "run this script as root."
echo "see file file-loc.txt on what files that are included"

rm -R build/rpm
# the working folder
mkdir -p build/rpm
cp -R rpm/* build/rpm
# add the required rpm folders
mkdir -p build/rpm/BUILD
mkdir -p build/rpm/BUILDROOT
mkdir -p build/rpm/INSTALL
mkdir -p build/rpm/RPMS
mkdir -p build/rpm/SOURCES
mkdir -p build/rpm/SPECS
mkdir -p build/rpm/SRPMS
#
# add some subfolders
mkdir -p build/rpm/INSTALL/usr/local/sbin
mkdir -p build/rpm/INSTALL/usr/local/bin
mkdir -p build/rpm/INSTALL/etc/xrdp
mkdir -p build/rpm/INSTALL/etc/pam.d/
mkdir -p build/rpm/INSTALL/usr/local/lib/xrdp
mkdir -p build/rpm/INSTALL/usr/local/share/xrdp
#
#
cp /usr/local/lib/xrdp/* build/rpm/INSTALL/usr/local/lib/xrdp/
#
cp /usr/local/bin/xrdp-genkeymap build/rpm/INSTALL/usr/local/bin/xrdp-genkeymap
cp /usr/local/bin/xrdp-keygen build/rpm/INSTALL/usr/local/bin/xrdp-keygen
cp /usr/local/bin/xrdp-sesadmin build/rpm/INSTALL/usr/local/bin/xrdp-sesadmin
cp /usr/local/bin/xrdp-sesrun build/rpm/INSTALL/usr/local/bin/xrdp-sesrun
cp /usr/local/bin/xrdp-sestest build/rpm/INSTALL/usr/local/bin/xrdp-sestest
# not included in file-loc.txt
cp /usr/local/bin/xrdp-dis build/rpm/INSTALL/usr/local/bin/xrdp-dis

# /usr/local/sbin/
cp /usr/local/sbin/xrdp build/rpm/INSTALL/usr/local/sbin/xrdp
cp /usr/local/sbin/xrdp-chansrv build/rpm/INSTALL/usr/local/sbin/xrdp-chansrv
cp /usr/local/sbin/xrdp-sesman build/rpm/INSTALL/usr/local/sbin/xrdp-sesman
cp /usr/local/sbin/xrdp-sessvc build/rpm/INSTALL/usr/local/sbin/xrdp-sessvc
#
cp /etc/xrdp/* build/rpm/INSTALL/etc/xrdp/
#
cp /etc/pam.d/xrdp-sesman build/rpm/INSTALL/etc/pam.d/xrdp-sesman
echo "man pages excluded !!!!!!!!!!!!!!"
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
cp /usr/local/share/xrdp/* build/rpm/INSTALL/usr/local/share/xrdp/
#
echo "Now all files are hopefully copied"
echo "********************************************************"
echo "********************************************************"
echo "                  Build RPM"
echo "********************************************************"
echo "********************************************************"
rpmbuild -vv -bb build/rpm/SPECS/xrdp.spec --buildroot=/home/administrator/masterbranchXRDP20130107/xrdp/build/rpm/INSTALL/
echo "********************************************************"
echo "The rpmmacro file in you home directory describes where you have your output"
echo "********************************************************"

