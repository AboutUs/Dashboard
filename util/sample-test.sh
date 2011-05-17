#!/bin/bash
# Tests the dashboard's data collection API against a legacy format.
set -e
set -x
set -u

HOSTNAME=$1
PORT=$2
TOTAL=$3
TODAY=$4
URL="http://$HOSTNAME:$PORT/dashboard"

curl --header "Content-type: application/json" -s -d "{\"collection\":\"Site Report Notify Me\", \"time_code\": $(date +%s), \"Total\": \"$TOTAL\", \"Today\": \"$TODAY\"}" $URL
