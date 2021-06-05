#!/bin/bash

$binroot/_result_by_content.sh 
cd $(pwd)'_by_content' && \
	echo "now in $(pwd)" && sleep 2 && \
$binroot/composite_content_result__for__by_content.sh \
|| echo "Could not get in "$(pwd)'_by_content'

#@STCGoal Add the creation of the galery and its publication
#@STCResult  An accessible web site !
