CURDIR=$(cd $(dirname "$0") && pwd)
. "$CURDIR/../config.sh"

NAME=apr-util
VERSION=1.5.4
SRC_URL=http://ftp.kddilabs.jp/infosystems/apache/apr/${NAME}-${VERSION}.tar.bz2
SRPM=http://vault.centos.org/6.7/os/Source/SPackages/apr-util-1.3.9-3.el6_0.1.src.rpm

install_srpm
rm_src apr-util-1.3.9.tar.bz2
rm_src apr-util-1.3.7-nodbmdso.patch
rm_src apr-util-1.3.9-CVE-2010-1623.patch
get_src
cp apr-util-1.5.4-nodbmdso.patch $SOURCESDIR/

patch_spec

do_build
