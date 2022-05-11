docker run --rm -it \
  -e "UPSTREAM_DOMAIN=svr.astia.xyz" \
  -e "UPSTREAM_PORT=9041" \
  -e "PROXY_DOMAIN=proxy.astia.xyz" \
  -l "com.dnsdock.name=proxy" \
  -l "com.dnsdock.image=astia" \
  outrigger/https-proxy:1.0

  #192.168.2.135 svr.astia.xyz api.astia.xyz
# 192.168.2.132 proxy.astia.xyzy
