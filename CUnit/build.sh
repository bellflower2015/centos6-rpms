CURDIR=$(cd $(dirname "$0") && pwd)
. "$CURDIR/../config.sh"

NAME=CUnit
VERSION=2.1.3
SRC_URL=http://sourceforge.net/settings/mirror_choices?projectname=cunit&filename=CUnit/2.1-3/CUnit-2.1-3.tar.bz2
SRPM=http://ftp-srv2.kddilabs.jp/Linux/packages/fedora/development/rawhide/source/SRPMS/c/CUnit-2.1.3-12.fc23.src.rpm

install_srpm

#patch_spec

do_build
