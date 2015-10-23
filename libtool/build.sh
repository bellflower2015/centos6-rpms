CURDIR=$(cd $(dirname "$0") && pwd)
. "$CURDIR/../config.sh"

NAME=libtool
VERSION=2.4.6
SRC_URL=ftp://ftp.gnu.org/gnu/libtool/${NAME}-${VERSION}.tar.gz
SRPM=http://ftp-srv2.kddilabs.jp/Linux/packages/fedora/development/rawhide/source/SRPMS/l/libtool-2.4.6-5.fc23.src.rpm

install_srpm

#patch_spec

do_build
