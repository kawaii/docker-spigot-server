#!/usr/bin/env sh
set -euo pipefail

if [ "$SPIGOT_AGREE_EULA" = true ] ; then
    echo 'eula=true' > eula.txt
fi

cat <<EOT > server.properties
# Minecraft server properties
view-distance=${SPIGOT_VIEW_DISTANCE:-10}
max-build-height=${SPIGOT_MAX_BUILD_HEIGHT:-256}
server-ip=${SPIGOT_SERVER_IP:-}
level-seed=${SPIGOT_LEVEL_SEED:-}
gamemode=${SPIGOT_GAMEMODE:-0}
server-port=${SPIGOT_PORT:-25565}
enable-command-block=${SPIGOT_ENABLE_COMMAND_BLOCK:-false}
allow-nether=${SPIGOT_ALLOW_NETHER:-true}
enable-rcon=${SPIGOT_ENABLE_RCON:-false}
op-permission-level=${SPIGOT_OP_PERMISSION_LEVEL:-4}
enable-query=${SPIGOT_ENABLE_QUERY:-false}
prevent-proxy-connections=${SPIGOT_PREVENT_PROXY_CONNECTIONS:-false}
generator-settings=${SPIGOT_GENERATOR_SETTINGS:-}
resource-pack=${SPIGOT_RESOURCE_PACK:-}
player-idle-timeout=${SPIGOT_PLAYER_IDLE_TIMEOUT:-0}
level-name=${SPIGOT_LEVEL_NAME:-world}
motd=${SPIGOT_MOTD:-A Minecraft Server}
force-gamemode=${SPIGOT_FORCE_GAMEMODE:-false}
hardcore=${SPIGOT_HARDCORE:-false}
white-list=${SPIGOT_WHITE_LIST:-false}
pvp=${SPIGOT_PVP:-true}
spawn-npcs=${SPIGOT_SPAWN_NPCS:-true}
generate-structures=${SPIGOT_GENERATE_STRUCTURES:-true}
spawn-animals=${SPIGOT_SPAWN_ANIMALS:-true}
snooper-enabled=${SPIGOT_SNOOPER_ENABLED:-false}
difficulty=${SPIGOT_DIFFICULTY:-1}
network-compression-threshold=${SPIGOT_NETWORK_COMPRESSION_THRESHOLD:-256}
level-type=${SPIGOT_LEVEL_TYPE:-DEFAULT}
spawn-monsters=${SPIGOT_SPAWN_MONSTERS:-true}
use-native-transport=${SPIGOT_USE_NATIVE_TRANSPORT:-true}
max-players=${SPIGOT_MAX_PLAYERS:-20}
resource-pack-sha1=${SPIGOT_RESOURCE_PACK_SHA1:-}
online-mode=${SPIGOT_ONLINE_MODE:-true}
allow-flight=${SPIGOT_ALLOW_FLIGHT:-false}
max-world-size=${SPIGOT_MAX_WORLD_SIZE:-29999984}
EOT

if [ ${SPIGOT_ENABLE_RCON:-false} = true ] ; then
    echo 'rcon.port='${SPIGOT_RCON_PORT:-25575} >> server.properties
    echo 'rcon.password='${SPIGOT_RCON_PASSWORD:-password} >> server.properties
fi

exec "$@"
