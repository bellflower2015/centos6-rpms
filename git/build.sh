dir=$(cd $(dirname "$0") && pwd)
. "$dir/../config.sh"

VERSION=2.6.2
URL=https://github.com/git/git/archive/v${VERSION}.tar.gz
SRPM=https://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/source/SRPMS/g/git-2.6.1-1.fc24.src.rpm

rpmi $SRPM

cd $SOURCESDIR
rm git-2.6.1.tar.gz
rm git-htmldocs-2.6.1.tar.gz
rm git-manpages-2.6.1.tar.gz
curl -L $URL -o git-${VERSION}.tar.gz

cd $SPECSDIR
patch git.spec < $dir/git.spec.patch
rpmbuild -bs --rmsource git.spec
sudo yum-builddep -y $SRPMSDIR/git-*.src.rpm
rpmbuild --rebuild --define="__check_files %{nil}" $SRPMSDIR/git-*.src.rpm

cd $dir
log_rpm
