#!/bin/bash

# Exit immediately if a command exists with a zero status
set -e

/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
