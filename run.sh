#!/usr/bin/env bash
cd /srv/www

if [ "$SLACK_SUBDOMAIN" == "" ]; then
    echo "Missing SLACK_SUBDOMAIN";
    exit 1;
fi

if [ "$SLACK_API_TOKEN" == "" ]; then
    echo "Missing SLACK_API_TOKEN";
    exit 1;
fi

slackin/bin/slackin --port $PORT $SLACK_SUBDOMAIN $SLACK_API_TOKEN
