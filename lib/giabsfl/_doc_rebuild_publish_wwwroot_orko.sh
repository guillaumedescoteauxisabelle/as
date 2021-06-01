(cd doc ; doxygen Doxyfile) ; cp -r doc /www/bsfl.tmp/;(cd /www;rm -rf *.deleteme;mv bsfl bsfl.deleteme && mv bsfl.tmp bsfl && msg_success "Great http://jgwill.com/bsfl/html" || msg_failed "opps")
