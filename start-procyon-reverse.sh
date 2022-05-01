#!/bin/bash
cd procyon-reverse
PROCYON_ADMIN_TOKEN="ilovepandas" \
PROXY_HTTP=8080 ./procyon-reverse

#PROXY_CRT="certs/procyon-reverse.local.crt" \
#PROXY_KEY="certs/procyon-reverse.local.key" \
#PROXY_HTTP=8080 \
#PROXY_HTTPS=4443 \
#PROCYON_ADMIN_TOKEN="ilovepandas" \
#./procyon-reverse
