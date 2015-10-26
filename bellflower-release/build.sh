CURDIR=$(cd $(dirname "$0") && pwd)
. "$CURDIR/../config.sh"

NAME=bellflower-release
VERSION=6

cp ${NAME}.spec $SPECSDIR/
cp bellflower.repo LICENSE RPM-GPG-KEY-BELLFLOWER $SOURCESDIR/

do_build
