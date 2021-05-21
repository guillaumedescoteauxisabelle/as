
# Run in context of the directory where $res'x' is.

tdir=../compredo;for c in $chks_long_all; do echo $c; for d in *x ; do  (cd $d; ls *$c'k'*$c'k'* 2> /dev/null && echo "Got something" && (mkdir -p $tdir/$c ;cp *$c'k'*$c'k'* $tdir/$c) || echo -n ".") ; done ; done
