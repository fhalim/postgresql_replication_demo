#!/bin/sh

# TODO: This should be idempotent
echo "host replication     replicator      0.0.0.0/0            md5" >> "${PGDATA}/pg_hba.conf"
echo "host replication     replicator      ::1/0                md5" >> "${PGDATA}/pg_hba.conf"
