dir=$(cd $(dirname "$0") && pwd)
. "$dir/../config.sh"

NAME=gitflow
VERSION=0.4.2.20120723git53e9c76
SRPM=https://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/source/SRPMS/g/${NAME}-${VERSION}-6.fc23.src.rpm

rpmi $SRPM

cd $SPECSDIR
rpmbuild -bs --rmsource ${NAME}.spec
sudo yum-builddep -y $SRPMSDIR/${NAME}-*.src.rpm
rpmbuild --rebuild $SRPMSDIR/${NAME}-*.src.rpm

cd $dir
log_rpm
