#!/bin/bash

if [ "$1" = "server" ]; then
    cd "/dnscat2/server/"
    shift
    "/usr/local/bin/ruby" "dnscat2.rb" "$@"
elif [ "$1" = "client" ]; then
    cd "/dnscat2/client/"
    shift
    "./dnscat" "$@"
else
    echo "Invalid mode. Use 'client' or 'server' mode."
fi
