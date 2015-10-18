dir=$(cd $(dirname "$0") && pwd)
. "$dir/../config.sh"

VERSION=7.4.898
URL=https://github.com/vim/vim/archive/v${VERSION}.tar.gz
SRPM=http://vault.centos.org/6.7/os/Source/SPackages/vim-7.4.629-5.el6.src.rpm

rpmi $SRPM

cd $SOURCESDIR
rm vim-7.4.tar.bz2
rm 7.4.[0-9][0-9][0-9]
rm vim-6.4-checkhl.patch
rm vim-7.0-specedit.patch
curl -L $URL -o v${VERSION}.tar.gz

cd $SPECSDIR
patch vim.spec < $dir/vim.spec.patch
rpmbuild -bs --rmsource vim.spec
sudo yum-builddep -y $SRPMSDIR/vim-*.src.rpm
rpmbuild --rebuild $SRPMSDIR/vim-*.src.rpm

cd $dir
log_rpm
