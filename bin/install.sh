#!/usr/bin/env bash

option=$1

wp plugin is-active amp
if [[ $? -eq 0 ]]; then
  wp plugin deactivate amp
fi

wp plugin is-installed amp
if [[ $? -eq 0 ]]; then
  wp plugin uninstall amp
fi

if [ "$option" == 'original' ]; then
  echo "Installing plugin from WordPress.org..."
  wp plugin install amp --version=2.0.6
elif [ "$option" == 'modified' ]; then
  echo "Installing plugin built with Composer v2.0.9..."
  wp plugin install amp.zip
fi
