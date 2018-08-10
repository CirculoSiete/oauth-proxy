#!/bin/ash
./bin/oauth2_proxy -login-url=${LOGIN_URL} \
  -redeem-url=${REDEEM_URL} \
  -validate-url=${VALIDATE_URL} \
  -upstream=${UPSTREAM} \
  -http-address=${ADRESS} \
  -client-id=${CLIENT_ID} \
  -client-secret=${CLIENT_SECRET} \
  -cookie-secret=${CLIENT_SECRET} \
  -email-domain="*" \
  -provider=${PROVIDER}