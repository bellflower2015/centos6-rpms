CURDIR=$(cd $(dirname "$0") && pwd)
. "$CURDIR/../config.sh"

NAME=bash-completion
SRPM=https://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/source/SRPMS/b/bash-completion-2.1-8.20150513git1950590.fc23.src.rpm

install_srpm

do_build
