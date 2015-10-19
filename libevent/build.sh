CURDIR=$(cd $(dirname "$0") && pwd)
. "$CURDIR/../config.sh"

NAME=libevent
VERSION=1.4.15
SRC_URL=https://github.com/libevent/libevent/archive/release-${VERSION}-stable.tar.gz
SRPM=http://vault.centos.org/6.7/os/Source/SPackages/libevent-1.4.13-4.el6.src.rpm

install_srpm

rm_src libevent-1.4.13-stable.tar.gz
rm_src libevent-1.4.13-stable-configure.patch
cp $CURDIR/libevent-1.4.15-stable-configure.patch $SOURCESDIR/
get_src libevent-${VERSION}-stable.tar.gz

patch_spec

do_build
