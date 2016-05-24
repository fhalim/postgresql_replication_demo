# Introduction

Example of using [the official docker container](https://hub.docker.com/_/postgres/) with [streaming replication](https://wiki.postgresql.org/wiki/Streaming_Replication)

# Running
## Prerequisites

- [docker](https://www.docker.com/products/docker-engine)
- [docker-compose](https://www.docker.com/products/docker-compose)

## Running

```sh
docker-compose up
```

## testing

Assuming that the docker host is at `127.0.0.1`

Create table in master
```sh
PGPASSWORD="password" psql -h 127.0.0.1 -p 5433 -U admin -c "CREATE TABLE people (name TEXT PRIMARY KEY, phone TEXT NOT NULL);" postgres

PGPASSWORD="password" psql -h 127.0.0.1 -p 5433 -U admin -c "INSERT INTO people VALUES ('bob', '555-5555');" postgres
```

Verify that the changes have made it to the slave

```sh
$ PGPASSWORD=password psql -h 127.0.0.1 -p 5434 -U admin -c "SELECT * FROM people;" postgres


 name |  phone
------+----------
 bob  | 555-5555
(1 row)

```

# TODO

- Manage slave startup/shutdown more cleanly
- Use replication slots on master
- Script out testing end-to-end
- Example of tracking lag between master and slave
