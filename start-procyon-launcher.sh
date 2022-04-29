#!/bin/bash
cd procyon-launcher; 

PROCYON_WASM_WORKER_PORT=9090 \
PROCYON_ADMIN_TOKEN="ilovepandas" \
./procyon-launcher
