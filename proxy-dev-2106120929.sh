pbase=41

thost=svr.astia.xyz
tdomain=proxy.astia.xyz

httpbase=90
httpsbase=91
tport=$httpbase$pbase
sport=$httpsbase$pbase
maxupload=40M

docker run -it --rm \
-e DOMAIN=$tdomain  \
-e TARGET_PORT=$tport  \
-e TARGET_HOST=$thost   \
-e SSL_PORT=$sport   \
-p $sport:$sport \
-e CLIENT_MAX_BODY_SIZE=$maxupload  \
fsouza/docker-ssl-proxy 

#@STCStatus works or not ??

