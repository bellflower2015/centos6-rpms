CURDIR=$(cd $(dirname "$0") && pwd)
. "$CURDIR/../config.sh"

NAME=httpd
VERSION=2.4.17
SRC_URL=http://ftp.kddilabs.jp/infosystems/apache/httpd/${NAME}-${VERSION}.tar.bz2

SRPM=http://vault.centos.org/6.7/os/Source/SPackages/httpd-2.2.15-45.el6.centos.src.rpm
install_srpm
rm_src README.confd
rm_src httpd-2.2.15.tar.gz
rm_src httpd.conf
rm_src ssl.conf
rm_src welcome.conf
rm_src manual.conf
rm_src htcacheclean.sysconf
rm $SOURCESDIR/*.patch
mkdir $SOURCESDIR/httpd22
httpd22src=(centos_index.html htcacheclean.init httpd.init httpd.logrotate httpd.sysconf)
for f in ${httpd22src[@]}; do
    mv $SOURCESDIR/$f $SOURCESDIR/httpd22
done

SRPM=http://ftp-srv2.kddilabs.jp/Linux/packages/fedora/development/rawhide/source/SRPMS/h/httpd-2.4.17-2.fc24.src.rpm
install_srpm
rm_src index.html
rm_src 00-systemd.conf
rm_src 10-listen443.conf
rm_src action-configtest.sh
rm_src action-graceful.sh
rm_src htcacheclean.service
rm_src httpd-ssl-pass-dialog
rm_src httpd.service
rm_src httpd.sysconf
rm_src httpd.tmpfiles
rm_src httpd.socket
rm_src welcome.conf
rm_src httpd-2.4.3-layout.patch
for f in ${httpd22src[@]}; do
    mv $SOURCESDIR/httpd22/$f $SOURCESDIR/
done
rmdir $SOURCESDIR/httpd22
cp $CURDIR/welcome.conf $SOURCESDIR/
cp $CURDIR/httpd-2.4.3-layout.patch $SOURCESDIR/

patch_spec

do_build
