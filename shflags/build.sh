dir=$(cd $(dirname "$0") && pwd)
. "$dir/../config.sh"

NAME=shflags
VERSION=1.0.3.20130117gitaf8d27d
SRC=https://github.com/kward/shflags/archive/af8d27d01bf074e06bf1326d4d9c5da9851d084e.tar.gz
SRPM=https://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/source/SRPMS/s/shflags-1.0.3-8.fc23.src.rpm

rpmi $SRPM

cd $SOURCESDIR
rm shflags-1.0.3.tgz
curl -LO $SRC
tar xzf af8d27d01bf074e06bf1326d4d9c5da9851d084e.tar.gz
mv shflags-af8d27d01bf074e06bf1326d4d9c5da9851d084e/source/1.0 shflags-1.0.3.20130117gitaf8d27d
tar czf shflags-1.0.3.20130117gitaf8d27d.tar.gz shflags-1.0.3.20130117gitaf8d27d
rm -rf shflags-af8d27d01bf074e06bf1326d4d9c5da9851d084e
rm -f af8d27d01bf074e06bf1326d4d9c5da9851d084e.tar.gz

cd $SPECSDIR
patch ${NAME}.spec < $dir/${NAME}.spec.patch
rpmbuild -bs --rmsource ${NAME}.spec
sudo yum-builddep -y $SRPMSDIR/${NAME}-*.src.rpm
rpmbuild --rebuild $SRPMSDIR/${NAME}-*.src.rpm

cd $dir
log_rpm
