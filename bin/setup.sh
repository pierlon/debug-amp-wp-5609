#!/usr/bin/env bash

if [ ! -f .env ]; then
  echo "Setting environment configuration..."
  cp .env.example .env
fi

wp core is-installed
if [[ $? -eq 1 ]]; then
  echo "Installing WordPress..."
  wp core install --title="AMP Composer Debug" --admin_user=admin --admin_password=password --admin_email=test@test.com --skip-email --url=https://amp-composer-debug.lndo.site  --quiet
fi

wp plugin is-active sentry_version_viewer
if [[ $? -eq 1 ]]; then
  wp plugin activate sentry_version_viewer
fi
