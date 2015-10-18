dir=$(cd $(dirname "$0") && pwd)
. "$dir/../config.sh"

VERSION=1.4.15
URL=https://github.com/libevent/libevent/archive/release-${VERSION}-stable.tar.gz
SRPM=http://vault.centos.org/6.7/os/Source/SPackages/libevent-1.4.13-4.el6.src.rpm

rpmi $SRPM

cd $SOURCESDIR
rm libevent-1.4.13-stable.tar.gz
rm libevent-1.4.13-stable-configure.patch
cp $dir/libevent-1.4.15-stable-configure.patch .
curl -L $URL -o libevent-${VERSION}-stable.tar.gz

cd $SPECSDIR
patch libevent.spec < $dir/libevent.spec.patch
rpmbuild -bs --rmsource libevent.spec
sudo yum-builddep -y $SRPMSDIR/libevent-*.src.rpm
rpmbuild --rebuild $SRPMSDIR/libevent-*.src.rpm

cd $dir
log_rpm
