

echo "Something now" && \
	((ls;sleep 1; echo "something that take a while";sleep 10; echo "We are finally done in bg") &) && \
sleep 2 && echo "The whole thing is done but the long process migh complete in few seconds" && sleep 2 || echo "FAILED"
