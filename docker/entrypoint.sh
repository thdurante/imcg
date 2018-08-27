#!/usr/bin/env bash

if [ "$MAILCATCHER" = "on" ]; then
  echo 'Starting mailcatcher...'
  mailcatcher --verbose --foreground &
fi

echo 'Starting rails server...'
rails server --binding 0.0.0.0 --port 4000
