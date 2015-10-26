CURDIR=$(cd $(dirname "$0") && pwd)
. "$CURDIR/../config.sh"

NAME=vim
VERSION=7.4.900
SRC_URL=https://github.com/vim/vim/archive/v${VERSION}.tar.gz
SRPM=http://vault.centos.org/6.7/os/Source/SPackages/vim-7.4.629-5.el6.src.rpm

install_srpm

rm_src vim-7.4.tar.bz2
rm $SOURCESDIR/7.4.[0-9][0-9][0-9]
rm_src vim-6.4-checkhl.patch
rm_src vim-7.0-specedit.patch

get_src

patch_spec

do_build
