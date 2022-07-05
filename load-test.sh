#!/bin/bash

URL=https://test-app-sm3-test-gateway-525eca1d5089dbdc-istio-system.apps.example.com/db-pg.php

RESP=`curl -sL -w "%{http_code} | %{remote_ip} | %{time_total}" -X GET -I "$URL" -o /dev/null`

I=0
PARALLEL=10
while true
do
for I in  `seq 1 $PARALLEL` ; do

curl -sL -w "%{http_code} | %{remote_ip} | %{time_total}" -X GET -I "$URL" -o /dev/null >> test.log &
done
done
