#!/bin/bash

jsessionid=$(curl -s "https://play.typeracer.com/" | grep jsession | sed -E 's/.*jsessionid=([A-Z0-9]*)".*/\1/')

response=$(curl -s "https://play.typeracer.com/gameserv;jsessionid=${jsessionid}" \
  -H 'authority: play.typeracer.com' \
  -H 'x-gwt-module-base: https://play.typeracer.com/com.typeracer.guest.Guest/' \
  -H 'x-gwt-permutation: 389E904CBFCFAACCBB5271A49AEB7849' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.113 Safari/537.36' \
  -H 'content-type: text/x-gwt-rpc; charset=UTF-8' \
  -H 'accept: */*' \
  -H 'origin: https://play.typeracer.com' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://play.typeracer.com/' \
  -H 'accept-language: en-US,en;q=0.9,es;q=0.8' \
  -H 'cookie: __cfduid=d37a6e28b3835d905cfb49d3627b811b91587664329; __utma=163867134.267254498.1587664330.1587664330.1587664330.1; __utmc=163867134; __utmz=163867134.1587664330.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); __utmt=1; _cmpQcif3pcsupported=1; tr_notice_tr_for_kids=2; prefs=%7B%22dateOfLastVisit%22%3A%201587664352230.0%2C%20%22dateOfPriorVisit%22%3A%201587664344603.0%2C%20%22domain%22%3A%20%22.typeracer.com%22%7D; __utmb=163867134.34.0.1587664352031' \
  --data-binary '7|1|6|https://play.typeracer.com/com.typeracer.guest.Guest/|BA5ECE70637D68B673B3226E6597421A|_|createAndJoinCustomRoom|y|1w|1|2|3|4|1|5|5|0|1|0|6|Jy7_ReNV|' \
  --compressed)

room_id=$(echo $response | sed -E 's/.*"1j","17","([A-Za-z0-9]*)".*/\1/')

echo "Enter your race here: https://play.typeracer.com?rt=${room_id}"