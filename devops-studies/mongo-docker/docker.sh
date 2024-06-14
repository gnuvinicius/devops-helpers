#!/bin/bash

docker run -d --name mongodb -p 27017:27017 \
  -e MONGO_INITDB_ROOT_USERNAME=garage474 \
  -e MONGO_INITDB_ROOT_PASSWORD=e296cd9f mongo