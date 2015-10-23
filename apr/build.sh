CURDIR=$(cd $(dirname "$0") && pwd)
. "$CURDIR/../config.sh"

NAME=apr
VERSION=1.5.2
SRC_URL=http://ftp.kddilabs.jp/infosystems/apache/apr/${NAME}-${VERSION}.tar.bz2
SRPM=http://vault.centos.org/6.7/os/Source/SPackages/apr-1.3.9-5.el6_2.src.rpm

install_srpm
rm_src apr-1.3.9.tar.bz2
rm_src apr-1.3.9-r1309394.patch
rm_src apr-1.3.9-CVE-2011-0419.patch
rm_src apr-1.2.7-fnmatch.patch
get_src

patch_spec

do_build
