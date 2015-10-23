CURDIR=$(cd $(dirname "$0") && pwd)
. "$CURDIR/../config.sh"

NAME=libev
VERSION=4.20
SRC_URL=http://dist.schmorp.de/libev/${NAME}-${VERSION}.tar.gz
SRPM=http://ftp-srv2.kddilabs.jp/Linux/packages/fedora/development/rawhide/source/SRPMS/l/libev-4.20-1.fc24.src.rpm

install_srpm

patch_spec

do_build
