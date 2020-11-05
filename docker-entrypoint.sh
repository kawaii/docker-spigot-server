#!/usr/bin/env sh
set -euo pipefail

if [ "$SPIGOT_AGREE_EULA" = true ] ; then
    echo 'eula=true' > eula.txt
fi

exec "$@"
