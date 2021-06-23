proxycontainertag=guillaumeai/server:sslproxy

tdomain=as.guillaumeisabelle.com
tport=22
sport=22
thost=192.168.2.132
maxupload=2000
docker run --rm -it \
                -e DOMAIN=$tdomain  \
                -e TARGET_PORT=$tport  \
                -e TARGET_HOST=$thost   \
                -e SSL_PORT=$sport   \
                -p $sport:$sport \
                -e CLIENT_MAX_BODY_SIZE=$maxupload  \
                $proxycontainertag	
#  -e "UPSTREAM_DOMAIN=as.guillaumeisabelle.com" \
#  -e "UPSTREAM_PORT=22" \
#  -e "PROXY_DOMAIN=gaia.guillaumeisabelle.com" \
#  -l "com.dnsdock.name=proxy" \
#  -l "com.dnsdock.image=astia" \
#  outrigger/https-proxy:1.0

  #192.168.2.135 svr.astia.xyz api.astia.xyz
# 192.168.2.132 proxy.astia.xyzy
