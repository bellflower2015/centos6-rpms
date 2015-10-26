CURDIR=$(cd $(dirname "$0") && pwd)
. "$CURDIR/../config.sh"

NAME=bellflower-test
VERSION=6

cp ${NAME}.spec $SPECSDIR/
cp ${NAME}.repo LICENSE RPM-GPG-KEY-BELLFLOWER $SOURCESDIR/

do_build
