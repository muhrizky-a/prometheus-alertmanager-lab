#!/bin/bash
docker run -d \
  --name prometheus \
  --network jenkins \
  --publish 9091:9090 \
  --volume "$(pwd)"/prometheus:/etc/prometheus/ \
  prom/prometheus

docker run -d \
  --name alertmanager \
  --network jenkins \
  --publish 9093:9093 \
  --volume "$(pwd)"/alertmanager:/etc/alertmanager/ \
   prom/alertmanager:latest
