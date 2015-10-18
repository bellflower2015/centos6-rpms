dir=$(cd $(dirname "$0") && pwd)
. "$dir/../config.sh"

VERSION=2.0
SRPM=https://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/source/SRPMS/t/tmux-2.0-2.fc23.src.rpm

rpmi $SRPM

cd $SPECSDIR
patch tmux.spec < $dir/tmux.spec.patch
rpmbuild -bs --rmsource tmux.spec
sudo yum-builddep -y $SRPMSDIR/tmux-*.src.rpm
rpmbuild --rebuild $SRPMSDIR/tmux-*.src.rpm

cd $dir
log_rpm
