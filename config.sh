RPMBUILDDIR=~/rpmbuild
builddirs=(BUILD BUILDROOT RPMS SOURCES SPECS SRPMS)
for d in ${builddirs[@]}; do
    printf -v "${d}DIR" "%s" "$RPMBUILDDIR/$d"
done

setup() {
    eval mkdir -p $RPMBUILDDIR/{$(echo ${builddirs[*]}|tr ' ' ',')}
}

clean() {
    rm -rf $RPMBUILDDIR
    setup
}

log_rpm() {
    local file=rpm_$(date +%Y%m%d_%H%M%S).log
    find ~/rpmbuild/SRPMS/ -type f -name "*.rpm" -printf '%f\n' >  $file
    find ~/rpmbuild/RPMS/  -type f -name "*.rpm" -printf '%f\n' >> $file
}

rpmi() {
    local srpm=$1
    local tmpdir=$(mktemp -d)
    local path=$tmpdir/$(basename $srpm)
    if echo "$srpm" | grep -s ^http; then
        curl -L $srpm -o $path
    fi
    rpm -i $path 2>/dev/null
    rm -rf $tmpdir
}
