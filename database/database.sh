#!/bin/bash

docker network create garage474-network || true

docker run -d \
  --name garage474-postgres \
  -p 5432:5432  \
  --restart unless-stopped \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=2AkByM4NfHFkeJz \
  -v ./pgdata:/var/lib/postgresql \
  --network garage474-network \
  postgres:18.6-alpine3.24
