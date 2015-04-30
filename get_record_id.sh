#!/bin/bash
CF_API_KEY="YOURAPIKEY"
CF_EMAIL="youremail@example.com"
CF_NAME="myhomerouter"
CF_ZONE="example.com"

function getJsonVal() {
   if [ \( $# -ne 1 \) -o \( -t 0 \) ]; then
       echo "Usage: getJsonVal 'key' < /tmp/file";
       echo "   -- or -- ";
       echo " cat /tmp/input | getJsonVal 'key'";
       return;
   fi;
   python -c "import json,sys;sys.stdout.write(json.dumps(json.load(sys.stdin)$1))";
}


exec curl -s https://www.cloudflare.com/api_json.html \
  -d "a=rec_load_all" \
  -d "tkn=${CF_API_KEY}" \
  -d "email=${CF_EMAIL}" \
  -d "z=${CF_ZONE}" \
  | getJsonVal "['response']['recs']['objs']" | sed -e 's/}/\n}\n/g' -e 's/{/\n{\n/g' -e 's/, /\n/g' | grep -e '"rec_id"' -e '"name"'