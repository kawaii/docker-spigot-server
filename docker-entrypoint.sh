#!/usr/bin/env bash
set -euo pipefail

echo 'eula=true' > /opt/spigot/eula.txt

exec "$@"
