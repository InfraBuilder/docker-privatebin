#!/bin/bash

CONFIG_FILE=/config/conf.php

for i in "$CONFIG_FILE" "/usr/local/etc/php/conf.d/docker-privatebin.ini"
do
    echo "Generating $i from template" >&2
    sed 's/"/\\\"/g;s/.*/echo "&"/e' $i.template > $i
done

case "$PRIVATEBIN_STORAGE" in
    "filesystem")
		echo "Configuring filesystem storage" >&2
        cat <<-EOF >> "$CONFIG_FILE"
		[model]
		; name of data model class to load and directory for storage
		; the default model "Filesystem" stores everything in the filesystem
		class = Filesystem
		[model_options]
		dir = PATH "${PRIVATEBIN_DATA_PATH}"
		EOF
        ;;
	"mysql")
		echo "Configuring mysql storage" >&2
		cat <<-EOF >> "$CONFIG_FILE"
		[model]
		class = Database
		[model_options]
		dsn = "mysql:host=${PRIVATEBIN_MYSQL_HOST};dbname=${PRIVATEBIN_MYSQL_DATABASE};charset=UTF8"
		tbl = "${PRIVATEBIN_MYSQL_TABLE_PREFIX}"    ; table prefix
		usr = "${PRIVATEBIN_MYSQL_USERNAME}"
		pwd = "${PRIVATEBIN_MYSQL_PASSWORD}"
		;opt[12] = ${PRIVATEBIN_MYSQL_ATTR_PERSISTENT}   ; PDO::ATTR_PERSISTENT
		EOF
		;;
	"sqlite")
		echo "Configuring sqlite storage" >&2
		cat <<-EOF >> "$CONFIG_FILE"
		[model]
		class = Database
		[model_options]
		dsn = "sqlite:" PATH "${PRIVATEBIN_SQLITE_DB_PATH}"
		usr = null
		pwd = null
		opt[12] = ${PRIVATEBIN_SQLITE_ATTR_PERSISTENT} ; PDO::ATTR_PERSISTENT
		EOF
		;;
	*)
		echo "Error, unrecognized storage '$PRIVATEBIN_STORAGE', must be 'filesystem', 'mysql' or 'sqlite'"
		exit 1
		;;
esac

chown www-data:www-data "$PRIVATEBIN_DATA_PATH"

exec $@