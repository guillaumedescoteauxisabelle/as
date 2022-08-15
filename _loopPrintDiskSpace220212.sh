for s in {1..91100} ; do df -h /c  | awk '/C/ { print $4}'; sleep 60 ; done

