#!/bin/bash
set -e -o pipefail

## Config
CF_API_KEY="YOURAPIKEY"
CF_REC="get your id from ./get_record_id.sh"
CF_EMAIL="youremail@example.com"
CF_NAME="myhomerouter"
CF_ZONE="example.com"

CF_TTL=600
CF_TYPE="A"
CF_MODE=0

## Get ip
ip_addr=$(curl -s http://api.ipify.org)

## Update cloudflare record
exec curl -s https://www.cloudflare.com/api_json.html \
  -d "a=rec_edit" \
  -d "tkn=${CF_API_KEY}" \
  -d "id=${CF_REC}" \
  -d "email=${CF_EMAIL}" \
  -d "z=${CF_ZONE}" \
  -d "type=${CF_TYPE}" \
  -d "name=${CF_NAME}" \
  -d "content=${ip_addr}" \
  -d "service_mode=${CF_MODE}" \
  -d "ttl=${CF_TTL}" | grep -q "\"result\":\"success\""