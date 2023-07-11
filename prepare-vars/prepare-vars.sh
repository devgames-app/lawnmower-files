#!/bin/bash

if [ -f .bootstrap.lock ]; then
  echo 'Error: Installation already finished, dont start this container' >&2
  exit 1
fi

# Fix CRLF to LF to avoid empty .env variables in sh scripts
sed -i 's/^M$//' ".env"
sed -i $'s/\r$//' ".env"
source .env

# hk4e.yml
sed "s/%MYSQL_ROOT_PASSWORD%/$MYSQL_ROOT_PASSWORD/g" hk4e.yml.tmpl > hk4e.yml
sed -i "s/%REDIS_PASSWORD%/$REDIS_PASSWORD/g" hk4e.yml
sed -i "s/%MUIP_PORT%/$MUIP_PORT/g" hk4e.yml

# hk4e_database.sql
sed "s/%HK4E_WORK_PASSWORD%/$HK4E_WORK_PASSWORD/g" data/hk4e_database.sql.tmpl > data/hk4e_database.sql
sed -i "s/%HK4E_READONLY_PASSWORD%/$HK4E_READONLY_PASSWORD/g" data/hk4e_database.sql
sed -i "s/%LOCAL_IP%/$LOCAL_IP/g" data/hk4e_database.sql
sed -i "s/%MUIP_PORT%/$MUIP_PORT/g" data/hk4e_database.sql
sed -i "s/%DEFAULT_REGION%/$DEFAULT_REGION/g" data/hk4e_database.sql

# dbgate.xml
sed "s/%LOCAL_IP%/$LOCAL_IP/g" config/dbgate.xml.tmpl > config/dbgate.xml
sed -i "s/%HK4E_WORK_PASSWORD%/$HK4E_WORK_PASSWORD/g" config/dbgate.xml
sed -i "s/%HK4E_READONLY_PASSWORD%/$HK4E_READONLY_PASSWORD/g" config/dbgate.xml
sed -i "s/%REDIS_PASSWORD%/$REDIS_PASSWORD/g" config/dbgate.xml
sed -i "s/%DEFAULT_REGION%/$DEFAULT_REGION/g" config/dbgate.xml
sed -i "s/%MUIP_PORT%/$MUIP_PORT/g" config/dbgate.xml
sed -i "s/%RELOAD_CONFIG_INTERVAL%/$RELOAD_CONFIG_INTERVAL/g" config/dbgate.xml

# dispatch.xml
sed "s/%LOCAL_IP%/$LOCAL_IP/g" config/dispatch.xml.tmpl > config/dispatch.xml
sed -i "s/%HK4E_WORK_PASSWORD%/$HK4E_WORK_PASSWORD/g" config/dispatch.xml
sed -i "s/%HK4E_READONLY_PASSWORD%/$HK4E_READONLY_PASSWORD/g" config/dispatch.xml
sed -i "s/%REDIS_PASSWORD%/$REDIS_PASSWORD/g" config/dispatch.xml
sed -i "s/%DEFAULT_REGION%/$DEFAULT_REGION/g" config/dispatch.xml
sed -i "s/%MUIP_PORT%/$MUIP_PORT/g" config/dispatch.xml
sed -i "s/%RELOAD_CONFIG_INTERVAL%/$RELOAD_CONFIG_INTERVAL/g" config/dispatch.xml

# gameserver.xml
sed "s/%LOCAL_IP%/$LOCAL_IP/g" config/gameserver.xml.tmpl > config/gameserver.xml
sed -i "s/%HK4E_WORK_PASSWORD%/$HK4E_WORK_PASSWORD/g" config/gameserver.xml
sed -i "s/%HK4E_READONLY_PASSWORD%/$HK4E_READONLY_PASSWORD/g" config/gameserver.xml
sed -i "s/%REDIS_PASSWORD%/$REDIS_PASSWORD/g" config/gameserver.xml
sed -i "s/%DEFAULT_REGION%/$DEFAULT_REGION/g" config/gameserver.xml
sed -i "s/%MUIP_PORT%/$MUIP_PORT/g" config/gameserver.xml
sed -i "s/%RELOAD_CONFIG_INTERVAL%/$RELOAD_CONFIG_INTERVAL/g" config/gameserver.xml

# gateserver.xml
sed "s/%EXT_IP%/$EXT_IP/g" config/gateserver.xml.tmpl > config/gateserver.xml
sed -i "s/%HK4E_WORK_PASSWORD%/$HK4E_WORK_PASSWORD/g" config/gateserver.xml
sed -i "s/%HK4E_READONLY_PASSWORD%/$HK4E_READONLY_PASSWORD/g" config/gateserver.xml
sed -i "s/%REDIS_PASSWORD%/$REDIS_PASSWORD/g" config/gateserver.xml
sed -i "s/%DEFAULT_REGION%/$DEFAULT_REGION/g" config/gateserver.xml
sed -i "s/%MUIP_PORT%/$MUIP_PORT/g" config/gateserver.xml
sed -i "s/%RELOAD_CONFIG_INTERVAL%/$RELOAD_CONFIG_INTERVAL/g" config/gateserver.xml

# muipserver.xml
sed "s/%LOCAL_IP%/$LOCAL_IP/g" config/muipserver.xml.tmpl > config/muipserver.xml
sed -i "s/%HK4E_WORK_PASSWORD%/$HK4E_WORK_PASSWORD/g" config/muipserver.xml
sed -i "s/%HK4E_READONLY_PASSWORD%/$HK4E_READONLY_PASSWORD/g" config/muipserver.xml
sed -i "s/%REDIS_PASSWORD%/$REDIS_PASSWORD/g" config/muipserver.xml
sed -i "s/%DEFAULT_REGION%/$DEFAULT_REGION/g" config/muipserver.xml
sed -i "s/%MUIP_PORT%/$MUIP_PORT/g" config/muipserver.xml
sed -i "s/%RELOAD_CONFIG_INTERVAL%/$RELOAD_CONFIG_INTERVAL/g" config/muipserver.xml

# multiserver.xml
sed "s/%LOCAL_IP%/$LOCAL_IP/g" config/multiserver.xml.tmpl > config/multiserver.xml
sed -i "s/%HK4E_WORK_PASSWORD%/$HK4E_WORK_PASSWORD/g" config/multiserver.xml
sed -i "s/%HK4E_READONLY_PASSWORD%/$HK4E_READONLY_PASSWORD/g" config/multiserver.xml
sed -i "s/%REDIS_PASSWORD%/$REDIS_PASSWORD/g" config/multiserver.xml
sed -i "s/%DEFAULT_REGION%/$DEFAULT_REGION/g" config/multiserver.xml
sed -i "s/%MUIP_PORT%/$MUIP_PORT/g" config/multiserver.xml
sed -i "s/%RELOAD_CONFIG_INTERVAL%/$RELOAD_CONFIG_INTERVAL/g" config/multiserver.xml

# nodeserver.xml
sed "s/%LOCAL_IP%/$LOCAL_IP/g" config/nodeserver.xml.tmpl > config/nodeserver.xml
sed -i "s/%HK4E_WORK_PASSWORD%/$HK4E_WORK_PASSWORD/g" config/nodeserver.xml
sed -i "s/%HK4E_READONLY_PASSWORD%/$HK4E_READONLY_PASSWORD/g" config/nodeserver.xml
sed -i "s/%REDIS_PASSWORD%/$REDIS_PASSWORD/g" config/nodeserver.xml
sed -i "s/%DEFAULT_REGION%/$DEFAULT_REGION/g" config/nodeserver.xml
sed -i "s/%MUIP_PORT%/$MUIP_PORT/g" config/nodeserver.xml
sed -i "s/%RELOAD_CONFIG_INTERVAL%/$RELOAD_CONFIG_INTERVAL/g" config/nodeserver.xml

# oaserver.xml
sed "s/%LOCAL_IP%/$LOCAL_IP/g" config/oaserver.xml.tmpl > config/oaserver.xml
sed -i "s/%HK4E_WORK_PASSWORD%/$HK4E_WORK_PASSWORD/g" config/oaserver.xml
sed -i "s/%HK4E_READONLY_PASSWORD%/$HK4E_READONLY_PASSWORD/g" config/oaserver.xml
sed -i "s/%REDIS_PASSWORD%/$REDIS_PASSWORD/g" config/oaserver.xml
sed -i "s/%DEFAULT_REGION%/$DEFAULT_REGION/g" config/oaserver.xml
sed -i "s/%MUIP_PORT%/$MUIP_PORT/g" config/oaserver.xml
sed -i "s/%RELOAD_CONFIG_INTERVAL%/$RELOAD_CONFIG_INTERVAL/g" config/oaserver.xml

# pathfindingserver.xml
sed "s/%LOCAL_IP%/$LOCAL_IP/g" config/pathfindingserver.xml.tmpl > config/pathfindingserver.xml
sed -i "s/%HK4E_WORK_PASSWORD%/$HK4E_WORK_PASSWORD/g" config/pathfindingserver.xml
sed -i "s/%HK4E_READONLY_PASSWORD%/$HK4E_READONLY_PASSWORD/g" config/pathfindingserver.xml
sed -i "s/%REDIS_PASSWORD%/$REDIS_PASSWORD/g" config/pathfindingserver.xml
sed -i "s/%DEFAULT_REGION%/$DEFAULT_REGION/g" config/pathfindingserver.xml
sed -i "s/%MUIP_PORT%/$MUIP_PORT/g" config/pathfindingserver.xml
sed -i "s/%RELOAD_CONFIG_INTERVAL%/$RELOAD_CONFIG_INTERVAL/g" config/pathfindingserver.xml

# tothemoonserver.xml
sed "s/%LOCAL_IP%/$LOCAL_IP/g" config/tothemoonserver.xml.tmpl > config/tothemoonserver.xml
sed -i "s/%HK4E_WORK_PASSWORD%/$HK4E_WORK_PASSWORD/g" config/tothemoonserver.xml
sed -i "s/%HK4E_READONLY_PASSWORD%/$HK4E_READONLY_PASSWORD/g" config/tothemoonserver.xml
sed -i "s/%REDIS_PASSWORD%/$REDIS_PASSWORD/g" config/tothemoonserver.xml
sed -i "s/%DEFAULT_REGION%/$DEFAULT_REGION/g" config/tothemoonserver.xml
sed -i "s/%MUIP_PORT%/$MUIP_PORT/g" config/tothemoonserver.xml
sed -i "s/%RELOAD_CONFIG_INTERVAL%/$RELOAD_CONFIG_INTERVAL/g" config/tothemoonserver.xml

# lawnmower-backup
sed "s/%HK4E_WORK_PASSWORD%/$HK4E_WORK_PASSWORD/g" bin/lawnmower-backup/server/config.ts.tmpl > bin/lawnmower-backup/server/config.ts

# lawnmower-muipweb
sed "s/%HK4E_READONLY_PASSWORD%/$HK4E_READONLY_PASSWORD/g" bin/lawnmower-muipweb/.env.local.tmpl > bin/lawnmower-muipweb/.env.local
sed -i "s/%DEFAULT_REGION%/$DEFAULT_REGION/g" bin/lawnmower-muipweb/.env.local
sed -i "s/%MUIP_PORT%/$MUIP_PORT/g" bin/lawnmower-muipweb/.env.local

# lawnmower-sdk
sed "s/%HK4E_WORK_PASSWORD%/$HK4E_WORK_PASSWORD/g" bin/lawnmower-sdk/src/config/index.js.tmpl > bin/lawnmower-sdk/src/config/index.js
sed -i "s/%DEFAULT_REGION%/$DEFAULT_REGION/g" bin/lawnmower-sdk/src/config/index.js
sed -i "s/%EXT_IP%/$EXT_IP/g" bin/lawnmower-sdk/src/config/index.js
