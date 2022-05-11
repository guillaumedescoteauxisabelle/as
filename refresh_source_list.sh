#!/bin/bash
# Refresh out source liset used by some apps

(cd $libroot/samples;$binroot/mk_source_list.sh ; cd $libroot/datasets;$binroot/mk_source_list.sh)
