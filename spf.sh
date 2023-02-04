#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Usage: $0 domain_name"
  exit 1
fi

domain=$1

# Retrieve the SPF record of the domain
spf=$(nslookup -q=TXT $domain | grep "text =" | awk -F'\"' '{print $2}')

# Check if an SPF record was found
if [ -z "$spf" ]; then
  echo "No SPF record found for $domain"
else
  echo "SPF record for $domain: $spf"
fi
