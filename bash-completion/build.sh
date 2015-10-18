dir=$(cd $(dirname "$0") && pwd)
. "$dir/../config.sh"

NAME=bash-completion
VERSION=2.1
SRPM=https://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/source/SRPMS/b/${NAME}-${VERSION}-8.20150513git1950590.fc23.src.rpm

rpmi $SRPM

cd $SPECSDIR
rpmbuild -bs --rmsource ${NAME}.spec
sudo yum-builddep -y $SRPMSDIR/${NAME}-*.src.rpm
rpmbuild --rebuild $SRPMSDIR/${NAME}-*.src.rpm

cd $dir
log_rpm
