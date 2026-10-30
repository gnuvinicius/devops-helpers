#!/usr/bin/env bash

docker network create garage474-network || true

docker run -d \
  --name garage474-rabbitmq \
  --restart unless-stopped \
  -p 5672:5672 \
  -p 15672:15672 \
  -e RABBITMQ_DEFAULT_USER="garage474-user" \
  -e RABBITMQ_DEFAULT_PASS="garage474-pass" \
  -v $(pwd)/rabbitmq_data:/var/lib/rabbitmq \
  --network garage474-network \
  rabbitmq:3-management-alpine