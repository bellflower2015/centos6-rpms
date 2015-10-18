dir=$(cd $(dirname "$0") && pwd)
. "$dir/../config.sh"

VERSION=2.1.1
URL=http://jonas.nitro.dk/tig/releases/tig-${VERSION}.tar.gz

cd $SOURCESDIR
curl -LO $URL
gunzip -c tig-${VERSION}.tar.gz | tar xf - tig-${VERSION}/tig.spec
cp tig-${VERSION}/tig.spec $SPECSDIR/
rmdir tig-${VERSION}

cd $SPECSDIR
patch tig.spec < $dir/tig.spec.patch
rpmbuild -bs --rmsource tig.spec
sudo yum-builddep -y $SRPMSDIR/tig-*.src.rpm
rpmbuild --rebuild $SRPMSDIR/tig-*.src.rpm

cd $dir
log_rpm
