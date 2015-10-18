dir=$(cd $(dirname "$0") && pwd)
. "$dir/../config.sh"

VERSION=6
BASENAME=bellflower-test-${VERSION}

tmpdir=$(mktemp -d)

cd $tmpdir
mkdir $BASENAME
cp $dir/bellflower-test.repo $BASENAME/
tar czf ${BASENAME}.tar.gz $BASENAME
mv ${BASENAME}.tar.gz $SOURCESDIR/

cd $dir
rm -rf $tmpdir
rpmbuild -ba bellflower-test.spec

cd $dir
log_rpm
