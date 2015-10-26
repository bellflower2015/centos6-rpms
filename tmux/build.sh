CURDIR=$(cd $(dirname "$0") && pwd)
. "$CURDIR/../config.sh"

NAME=tmux
VERSION=2.1
SRC_URL=https://github.com/tmux/tmux/releases/download/2.1/${NAME}-${VERSION}.tar.gz
SRPM=https://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/source/SRPMS/t/tmux-2.0-2.fc23.src.rpm

install_srpm
get_src

patch_spec

do_build
