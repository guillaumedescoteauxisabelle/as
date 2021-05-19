#cp ../__fn.sh ../lib/giab.sh
#cp ../__fn.sh ../giab.sh

doxygen Doxyfile
ns=giabin
cp -r . /www/$ns.tmp/
(cd /www;(if [ -d "$ns" ];then rm -rf giabin.deleteme &> /dev/null;mv giabin giabin.deleteme &> /dev/null;fi) 
mv giabin.tmp giabin && msg_success "Great http://jgwill.com/giabin/html" || msg_failed "opps")
