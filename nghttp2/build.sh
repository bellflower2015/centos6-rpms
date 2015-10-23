CURDIR=$(cd $(dirname "$0") && pwd)
. "$CURDIR/../config.sh"

NAME=nghttp2
VERSION=1.3.4
SRC_URL=https://github.com/tatsuhiro-t/nghttp2/releases/download/v${VERSION}/${NAME}-${VERSION}.tar.bz2
SRPM=http://ftp-srv2.kddilabs.jp/Linux/packages/fedora/development/rawhide/source/SRPMS/n/nghttp2-1.3.4-1.fc24.src.rpm

install_srpm

#patch_spec

do_build
